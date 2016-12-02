class MiniCourseApplicationsController < ApplicationController
  before_action :authenticate_admin!, except: [:create]

  def index
    @mini_course_applications = MiniCourseApplication.all
  end

  def show
    @mini_course_application = MiniCourseApplication.find(params[:id])
  end

  def create
    @mini_course_application = MiniCourseApplication.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], phone: params[:phone], statement: params[:statement], mini_course_id: params[:mini_course_id])
    if @mini_course_application.save
      #AcltcMailer.mini_course_application_email(@mini_course_application).deliver_now
      flash[:success] = "Mini Course Application saved. You should also receive a confirmation email."
      redirect_to "/mini_courses/#{params[:mini_course_id]}"
    else
      render "/mini_courses/#{params[:mini_course_id]}"
    end
  end

end
