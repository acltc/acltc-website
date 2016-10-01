class JobOpeningsController < ApplicationController
  before_action :set_job_opening, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @job_openings = JobOpening.all
    render :layout => 'corporate_training_home'
  end

  def new
    @job_opening = JobOpening.new
  end

  def create
    @job_opening = JobOpening.new(job_opening_params)

    if @job_opening.save
      flash[:success] = "Job listing successfully created"
      redirect_to job_openings_path
    else
      flash[:warning] = "Job listing was not created"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    if @job_opening.destroy
      flash[:success] = "Job listing successfully deleted"
      redirect_to job_openings_path
    else 
      flash[:warning] = "Job listing was not deleted"
      render :show
    end
  end

  private
    def set_job_opening
      @job_opening = JobOpening.find_by(id: params[:id])
    end

    def job_opening_params
      params.require(:job_opening).permit(
        :title,
        :location,
        :salary,
        :description
      )
    end
end
