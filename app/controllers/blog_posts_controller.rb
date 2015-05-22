class BlogPostsController < ApplicationController
  before_filter :authenticate_admin!, only: [:new, :create, :delete]

  def index
    @blog_posts = BlogPost.includes(:admin).order(id: :desc).all
  end

  def new
    @blog_post = BlogPost.new
    @blog_post.blog_categories.build
  end

  def create
    @blog_post = BlogPost.new(blog_post_params)
    @blog_post.admin_id = current_admin.id
    if @blog_post.save
      flash[:success] = "Post should appear on this page."
      redirect_to blog_post_path(@blog_post)
    else
      render 'new'
    end
  end

  def show
    @blog_post = BlogPost.find(params[:id])
    @blog_post_next = @blog_post.next
    @blog_post_previous = @blog_post.previous
    @blog_posts = BlogPost.order(id: :desc).all
  end

  def edit
    @blog_post = BlogPost.find(params[:id])
  end

  private

  def blog_post_params
    params.required(:blog_post).permit(:title, :content, blog_category_ids: [])
  end

  
end
