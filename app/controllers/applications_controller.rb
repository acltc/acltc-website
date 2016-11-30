class ApplicationsController < ApplicationController
  before_action :authenticate_admin!, except: [:new, :create]
  invisible_captcha only: [:create], honeypot: :subtitle

  def index
    @applications = Application.all
    @tours = Tour.all

    if params[:location_filter]
      @applications = Application.where(location: params[:location_filter])
      pp @applications
    end

    @applications = Application.order(params[:sort]) if params[:sort]
    @applications = Application.where(status: params[:status]) if params[:status]

    respond_to do |format|
      format.html
      format.csv { send_data @applications.to_csv }
    end
  end

  def show
    @application = Application.find(params[:id])
  end

  def edit
    @application = Application.find(params[:id])
  end

  def new
    if params[:application_type] == "scholarship"
      redirect_to '/pages/scholarship_thank_you'
    else
      @application = Application.new
      if params[:id] # auto populate subsrciber fields from first step
        subscriber = Subscriber.find(params[:id])
        @application.first_name = subscriber.first_name
        @application.email = subscriber.email
      end
    end
  end

  def create
    @application = Application.new(application_params)
    if @application.save
      @application.interview.update(booked: true)
      AcltcMailer.application_email(@application).deliver_now
      AcltcMailer.application_email_reply(@application).deliver_now
      redirect_to "/pages/thank_you"
    else
      render :new
    end
  end

  def update
    @application = Application.find(params[:id])
    status_changed = true unless @application.status == params[:application][:status]

    if @application.update(application_params)
      if status_changed
        @application.statuses.create(text: params[:application][:status], date: Date.today)
      end
      flash[:info] = "Application status updated!"
      redirect_to @application
    else
      flash[:danger] = "Something went wrong!"
      redirect_to @application
    end
  end

  def destroy
    @application = Application.find(params[:id])
    if @application.interview
      @application.interview.update(booked: false)
    end
    @application.destroy

    flash[:danger] = "Application successfully deleted!"
    redirect_to "/applications"
  end

  private

  def application_params
    params.require(:application).permit(:first_name, :last_name, :email, :phone, :address,
    :emergency_contact, :learn_about_acltc, :learn_about_acltc_specify, :current_occupation,
    :primary_goals, :programming_experience, :preferred_work_location,
    :work_concurrently, :tinker_example, :why_better, :status, :location, :cohort,
    :notes, :interview_id)
  end


end
