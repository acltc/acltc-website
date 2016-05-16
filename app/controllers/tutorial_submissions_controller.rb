class TutorialSubmissionsController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :ajax_update]

  def index
    @grouped_submissions = {}
    LessonsController::LESSONS.each do |lesson|
      @grouped_submissions[lesson[:title]] = TutorialSubmission
        .where(lesson_title: lesson[:title])
        .order(:gist_url)
    end
  end

  def create
    @tutorial_submission = TutorialSubmission.new(
      lesson_title: params[:lesson_title],
      gist_url: params[:gist_url],
      reviewed: false
    )
    if @tutorial_submission.save
      flash[:success] = "Submission saved!"
    else
      flash[:error] = "Submission not saved!"
    end
    redirect_to "/tutorial/lessons/#{params[:lesson_title].parameterize}"
  end

  def ajax_update
    submissions = TutorialSubmission.where(gist_url: params[:gist_url])
    if submissions.length > 0 && submissions.update_all(reviewed: params[:reviewed])
      render json: {
        message: "success",
        gist_url: params[:gist_url],
        reviewed: params[:reviewed]
      }
    else
      render json: {
        message: "failed to update tutorial submissions"
      }, status: 422
    end
  end
end
