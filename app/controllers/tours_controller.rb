class ToursController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :show, :edit, :update, :destroy]
  before_action :set_tour, only: [:show, :edit, :update, :destroy]

  def index
    @tours = Tour.all

    if params[:location_filter]
      @tours = Tour.where(city: params[:location_filter])
      pp @tours
    end

    @tours = Tour.order(params[:sort]) if params[:sort]

    respond_to do |format|
      format.html
      format.csv { send_data @tours.to_csv }
    end
  end

  def new
    @tour = Tour.new
    split_test
    
    if params[:long]
      @long = true
    end
  end

  def create
    @tour = Tour.new(tour_params)

    if @tour.save
      create_hubspot_contact
      # @tour.interview.update(booked: true)
      AcltcMailer.tour_email(@tour).deliver_now
      AcltcMailer.tour_email_reply(@tour).deliver_now
      redirect_to tours_thank_you_path
      converted!("Book A Tour New Form Test")
    else
      split_test
      render :new
    end
  end

  def show
    @tour = Tour.find_by(id: params[:id])
  end

  def edit
  end

  def update
    @initial_interview = @tour.interview

    if @tour.update(tour_params)
      if @tour.interview != @initial_interview
        @initial_interview.update(booked: false)
        @tour.interview.update(booked: true)
      end
    
      flash[:info] = "Tour updated!"
      redirect_to @tour
    else
      flash[:danger] = "Something went wrong!"
      render :edit
    end
  end

  def destroy
    if @tour.interview
      @tour.interview.update(booked: false)
    end
    @tour.destroy

    flash[:danger] = "Tour successfully deleted!"
    redirect_to tours_path
  end

  def thank_you
  end

  private
    def set_tour
      @tour = Tour.find(params[:id])
    end

    def tour_params
      params.require(:tour).permit(
        :city,
        :first_name,
        :last_name,
        :email,
        :phone,
        :interview_id,
        :notes,
        :long
      )
    end

    def split_test
      @tour_split_test = ab_test("Book A Tour New Form Test", ["Book A Tour Long Form", "Book A Tour Short Form"])
    end

    def create_hubspot_contact
      lower_levels = ["Mousetrap", "Info Session"]
      contact = Hubspot::Contact.find_by_email(tour_params[:email])
      if contact
        if lower_levels.include?(contact["lead_type"])
          contact.update!({lead_type: "Tour"})
        end
      else
        Hubspot::Contact.create!(tour_params[:email], {firstname: tour_params[:first_name], lastname: tour_params[:last_name], phone: tour_params[:phone], lead_type: "Tour"})
      end   
    end

end
