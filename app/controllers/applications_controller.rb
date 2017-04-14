class ApplicationsController < ApplicationController
  before_action :authenticate_admin!, except: [:new, :create]
  include CohortDatesHelper
  invisible_captcha only: [:create], honeypot: :subtitle

  def index
    @applications = Application.all
    @tours = Tour.all

    if params[:location_filter]
      @applications = Application.where(location: params[:location_filter])
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

    cohort_dates = cohort_start_dates
    @dates_by_city = []

    cohort_dates.each do |cohort_date|
      if cohort_date[:prework] && Time.zone.now <= cohort_date[:date] + 1.month
        @dates_by_city << ["CHI #{cohort_date[:date].strftime('%m/%d/%y')}"]
        @dates_by_city << ["NYC #{cohort_date[:date].strftime('%m/%d/%y')}"]
        @dates_by_city << ["SF #{cohort_date[:date].strftime('%m/%d/%y')}"]
      end
    end

    @dates_by_city.sort!
  end

  def edit
    @application = Application.find(params[:id])
  end

  def new
    if params[:application_type] == "scholarship"
      redirect_to '/pages/scholarship_thank_you'
    else
      @application = Application.new
    end
  end

  def create
    @application = Application.new(application_params)
    if @application.save
      create_new_lead
      AcltcMailer.application_email(@application).deliver_now
      AcltcMailer.application_email_reply(@application).deliver_now
      redirect_to "/pages/thank_you"
    else
      render 'new'
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
    :notes, :long)
  end

  def create_hubspot_contact
    begin
      lower_levels = ["Mousetrap", "Info Session", "Tour"]
      contact = Hubspot::Contact.find_by_email(application_params[:email])
      if contact
        if lower_levels.include?(contact["lead_type"])
          contact.update!({lead_type: "Complete Application"})
        end
      else
        Hubspot::Contact.create!(application_params[:email], {firstname: application_params[:first_name], lastname: application_params[:last_name], phone: application_params[:phone], lead_type: "Complete Application", created_at: @application.created_at })
      end
    rescue Exception => e
      p "rescue #{e.message}"
    end
  end

end