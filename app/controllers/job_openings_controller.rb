class JobOpeningsController < ApplicationController

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
      flash[:success] = "Job successfully created"
      render :show
    else
      flash[:warning] = "Job wasn't created"
      render :new
    end
  end

  def show
    @job_opening = JobOpening.find_by(id: params[:id])
  end

  private

    def job_opening_params
      params.require(:job_opening).permit(
        :title,
        :location,
        :salary,
        :description
      )
    end
end
