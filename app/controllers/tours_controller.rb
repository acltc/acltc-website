class ToursController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :show, :edit, :update, :destroy]
  before_action :set_tour, only: [:show, :edit, :update, :destroy]

  def index
    @tours = Tour.all

    if params[:location_filter]
      @tours = Tour.where(city: params[:location_filter])
    end

    @tours = Tour.order(params[:sort]) if params[:sort]

    respond_to do |format|
      format.html
      format.csv { send_data @tours.to_csv }
    end
  end

  def new
    record_return_to_website_event
    @tour = Tour.new
    @tour_page = "loaded"
  end

  def create
    @tour = Tour.new(tour_params)
    if request.location
      if city = request.location.city
        @tour_city = city
      end
      if state = request.location.state
        @tour_state = state
      end
      if postal_code = request.location.postal_code
        @tour_postal_code = postal_code
      end
    end
    if request.remote_ip 
      @tour_ip_address = request.remote_ip
    else
      @tour_ip_address = "Not Found"
    end

    if @tour_city
      @tour_city = "Not Found"
    end
    if @tour_state
      @tour_state = "Not Found"
    end
    if @tour_postal_code 
      @tour_postal_code = "Not Found"
    end
    
    if @tour.save

      create_hubspot_contact

      client = Drip::Client.new do |c|
        c.api_key = ENV["DRIP_CLIENT_API_TOKEN"]
        c.account_id = ENV["DRIP_ACCOUNT_ID"]
      end

      client.create_or_update_subscriber(@tour.email, {custom_fields: {first_name: @tour.first_name, cell_phone: @tour.phone, mousetrap: "Tour", city: @tour_city}})
      client.apply_tag(@tour.email, "Booked tour")
      client.subscribe(@tour.email, 34197704)

      AcltcMailer.tour_email(@tour, @tour_city, @tour_state, @tour_postal_code, @tour_ip_address).deliver_now
      AcltcMailer.tour_email_reply(@tour).deliver_now
      redirect_to tours_thank_you_path
    else
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
        :long,
      )
    end

    def create_hubspot_contact
      begin
        lower_levels = ["Mousetrap", "Info Session"]
        contact = Hubspot::Contact.find_by_email(tour_params[:email])
        if contact
          if lower_levels.include?(contact["lead_type"])
            contact.update!({lead_type: "Tour"})
          end
        else
          Hubspot::Contact.create!(tour_params[:email], {firstname: tour_params[:first_name], lastname: tour_params[:last_name], phone: tour_params[:phone], lead_type: "Tour", created_at: @tour.created_at })
        end
      rescue Exception => e
        p "rescue #{e.message}"
      end
    end

end