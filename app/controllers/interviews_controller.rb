class InterviewsController < ApplicationController
before_action :authenticate_admin!, except: [:interview_options]


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

    if params[:release] && params[:application_id]
      @interview.update(booked: false)
      @application = Application.find(params[:application_id])
      @application.update(interview_id: nil)
      flash[:info] = "Interview slot released!"
      redirect_to "/interviews"
    elsif params[:release] && params[:tour_id]
      @interview.update(booked: false)
      @tour = Tour.find(params[:tour_id])
      @tour.update(interview_id: nil)
      flash[:info] = "Tour slot released!"
      redirect_to "/interviews"
    elsif @interview.update_attributes(interview_params)
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

  def interview_options
    @interviews = Interview.where('starts_at > ? AND starts_at < ?', DateTime.now, DateTime.now + 200.hours).where(booked: false).where("location = '" + params[:id] + "' OR location IS NULL").order(starts_at: :asc)

    @interviews_friendly_date = []
    @interviews.each do |interview|
      @interviews_friendly_date << { id: interview.id, starts_at: interview.interview_time_zone}
    end

    respond_to do |format|
      format.json { render json: @interviews_friendly_date }
    end
  end

  private

  def interview_params
    params.require(:interview).permit(:starts_at, :booked, :location)
  end

end
