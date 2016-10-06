class LakewoodApplicationsController < ApplicationController
  before_action :authenticate_admin!, except: [:new, :create]
  invisible_captcha only: [:create], honeypot: :subtitle
  
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
    @lakewood_application.destroy

    flash[:success] = "Application successfully deleted!"
    redirect_to "/lakewood_applications"
  end

  private

  def lakewood_application_params
    params.require(:lakewood_application).permit(:first_name, :last_name, :email, :phone, :address,
    :emergency_contact, :learn_about_acltc, :learn_about_acltc_specify,
    :primary_goals, :programming_experience, :preferred_work_location, :tinker_example, :why_better, :status, :location, :cohort,
    :notes, :hangouts_email, :proficiency_with_computers_and_technology, :currently_a_student, :student_part_or_full_time, :institution_name, :institution_city, :institution_state, :institution_zip, :student_concurrently, :currently_employed, :employed_part_or_full_time, :employer_name, :employer_city, :employer_state, :employer_zip, :employed_concurrently)
  end
end
