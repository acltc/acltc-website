class MiniCoursesController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create, :update, :delete]

  def index
    @blog_posts_all = BlogPost.friendly.includes(:admin).order(id: :desc).all
    @mini_courses = MiniCourse.all
  end

  def show
    @blog_posts_all = BlogPost.friendly.includes(:admin).order(id: :desc).all
    @mini_course = MiniCourse.find(params[:id])
  end

  def new
    @mini_course = MiniCourse.new
  end

  def create
    @mini_course = MiniCourse.new(mini_course_params)
    if @mini_course.save
    redirect_to mini_course_path(@mini_course)
    else
      render :new
    end
  end

  def edit
    @mini_course = MiniCourse.find(params[:id])
  end

  def update
    @mini_course = MiniCourse.find(params[:id])
    @mini_course.update(mini_course_params)
    p @mini_course
    if @mini_course.save
      redirect_to mini_course_path(@mini_course)
    else
      render :update
    end
  end

  def destroy
    MiniCourse.find(params[:id]).destroy
  end



  private

  def mini_course_params
    params.require(:mini_course).permit(:name, :start_date, :end_date, :location_id, :description, :skills_learned, :prerequisites)
  end

end
