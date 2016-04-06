class ApplicationsController < ApplicationController
  before_action :authenticate_admin!, except: [:new, :create]

  def index
    @applications = Application.all

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
    @application = Application.new
  end

  def create
    @application = Application.new(application_params)
    if @application.save
      AcltcMailer.application_email(@application).deliver_now
      redirect_to "/pages/thank_you.com"
    else
      render :new
    end
  end

  def update
    @application = Application.find(params[:id])

    if @application.update_attributes(application_params)
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
    params.require(:application).permit(:first_name, :last_name, :email, :phone, :address, :emergency_contact, :learn_about_acltc, :learn_about_acltc_specify, :current_occupation, :scholarship_applicant, :learn_about_scholarship, :minority, :woman, :why_scholarship, :primary_goals, :programming_experience, :preferred_work_location, :capstone_idea, :work_concurrently, :tinker_example, :why_better, :location, :status, :cohort, :subtitle )
  end

end
