class InterviewsController < ApplicationController
before_action :authenticate_admin!

  def index
    @interview = Interview.all
  end

  def show
    @interview = Interview.find(params[:id])
  end

  def edit
    @interview = Interview.find(params[:id])
  end

  def new
    @interview = Interview.new
  end

  def create
    @interview = Interview.new(interview_params)
    if @interview.save
      flash[:success] = "Interview slot created!"
      redirect_to new_interview_path
    else
      render :new
    end
  end

  def update
    @interview = Interview.find(params[:id])
    if @interview.update_attributes(interview_params)
      flash[:info] = "Interview slot updated!"
      redirect_to new_interview_path
    else
      flash[:danger] = "Something went wrong!"
      redirect_to edit_interview_path
    end
  end

  def destroy
    @interview = Interview.find(params[:id])
    @interview.destroy

    flash[:danger] = "Interview successfully deleted!"
    redirect_to "/interviews"
  end

  private

  def interview_params
    params.require(:interview).permit(:starts_at, :booked)
  end

end
