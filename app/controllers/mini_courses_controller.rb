class MiniCoursesController < ApplicationController

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

end
