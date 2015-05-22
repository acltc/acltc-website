class BlogPostsController < ApplicationController

  def index
    @blog_posts = BlogPost.includes(:admin).all
  end

  def show
  end

  def new
    @blog_post = BlogPost.new
  end
  
end
