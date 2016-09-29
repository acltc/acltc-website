class LakewoodApplicationsController < ApplicationController
  def index
    @lakewood_applications = LakewoodApplication.all

    if params[:location_filter]
      @lakewood_applications = LakewoodApplication.where(location: params[:location_filter])
      pp @lakewood_applications
    end

    @lakewood_applications = LakewoodApplication.order(params[:sort]) if params[:sort]
    @lakewood_applications = LakewoodApplication.where(status: params[:status]) if params[:status]

    respond_to do |format|
      format.html
      format.csv { send_data @lakewood_applications.to_csv }
    end
  end

  def show
    @lakewood_application = LakewoodApplication.find(params[:id])
  end

  def edit
    @lakewood_application = LakewoodApplication.find(params[:id])
  end

  def new
    if params[:application_type] == "scholarship"
      redirect_to '/pages/scholarship_thank_you'
    else
      @lakewood_application = LakewoodApplication.new
      if params[:id] # auto populate subsrciber fields from first step
        subscriber = Subscriber.find(params[:id])
        @lakewood_application.first_name = subscriber.first_name
        @lakewood_application.email = subscriber.email
      end
    end
  end

  def create
    @lakewood_application = LakewoodApplication.new(lakewood_application_params)
    if @lakewood_application.save
      AcltcMailer.lakewood_application_email(@lakewood_application).deliver_now
      redirect_to "/pages/thank_you"
    else
      render :new
    end
  end

  def update
    @lakewood_application = LakewoodApplication.find(params[:id])
    status_changed = true unless @lakewood_application.status == params[:lakewood_application][:status]

    if @lakewood_application.update(lakewood_application_params)
      if status_changed
        @lakewood_application.statuses.create(text: params[:lakewood_application][:status], date: Date.today)
      end
      flash[:info] = "Application status updated!"
      redirect_to @lakewood_application
    else
      flash[:danger] = "Something went wrong!"
      redirect_to @lakewood_application
    end
  end

  def destroy
    @lakewood_application = LakewoodApplication.find(params[:id])
    if @lakewood_application.interview
      @lakewood_application.interview.update(booked: false)
    end
    @lakewood_application.destroy

    flash[:danger] = "Application successfully deleted!"
    redirect_to "/applications"
  end

  private

  def lakewood_application_params
    params.require(:lakewood_application).permit(:first_name, :last_name, :email, :phone, :address,
    :emergency_contact, :learn_about_acltc, :learn_about_acltc_specify, :current_occupation,
    :primary_goals, :programming_experience, :preferred_work_location,
    :work_concurrently, :tinker_example, :why_better, :status, :location, :cohort,
    :notes, :hangouts_email, :proficiency_with_computers_and_technology)
  end
end
