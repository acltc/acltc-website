class ApplicationsController < ApplicationController
  before_action :authenticate_admin!, except: [:new, :create]

  def index
    @applications = Application.all
  end

  def show
    @application = Application.find(params[:id])
  end


  def new
    @application = Application.new
  end

  def create
    @application = Application.new(application_params)
    if @application.save
      AcltcMailer.application_email(@application).deliver_now
      flash[:success] = "Application saved. You should also receive a confirmation email."
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def application_params
    params.require(:application).permit(:legal_name, :email, :phone, :address, :emergency_contact, :learn_about_acltc, :current_occupation, :scholarship_applicant, :primary_goals, :programming_experience, :preferred_work_location, :capstone_idea, :work_concurrently, :tinker_example, :why_better, :location_ids )
  end

end
