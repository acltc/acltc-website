class BlogPostsController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create, :update, :delete]

  def index
    record_return_to_website_event
    if current_admin
      @blog_posts_all = BlogPost.friendly.includes(:admin).order(id: :desc).all
      if params[:category]
        @blog_posts = BlogPost.friendly.includes(:blog_categories, :admin).where(blog_categories: {name: params[:category]}).order(id: :desc)
      else
        @blog_posts = @blog_posts_all
      end
    else
      @blog_posts_all = BlogPost.where(published?: true).friendly.includes(:admin).order(id: :desc).all
      if params[:category]
        @blog_posts = BlogPost.where(published?: true).friendly.includes(:blog_categories, :admin).where(blog_categories: {name: params[:category]}).order(id: :desc)
      else
        @blog_posts = @blog_posts_all
      end
    end
    render layout: 'main'
  end

  def new
    @blog_post = BlogPost.new
    @blog_post.blog_categories.build
  end

  def create
    blog_post = BlogPost.new(blog_post_params.merge({published?: true}))
    if blog_post.save
      blog_post.blog_pics.each_with_index do |file, index|
        image_placeholder = "IMAGE#{index+1}"
        blog_post.content.sub!(image_placeholder, file.blog_pic.url)
      end
      if blog_post.save
        flash[:success] = "Post should appear on this page."
        redirect_to blog_post_path(blog_post)
      else
        render 'new'
      end
    else
      render 'new'
    end
  end

  def show
    record_return_to_website_event
    @blog_posts_all = BlogPost.where(published?: true).friendly.includes(:admin).order(id: :desc).all
    published = BlogPost.friendly.find(params[:id]).published? if params[:id]
    published = BlogPost.friendly.find(params[:title]).published? if params[:title]
    if current_admin || published
      @blog_post = BlogPost.friendly.find(params[:id]) if params[:id]
      @blog_post = BlogPost.friendly.find(params[:title]) if params[:title]
    else
      redirect_to blog_posts_path
    end
    @blog_post_next = @blog_post.next
    @blog_post_previous = @blog_post.previous

    render layout: 'main'
  end

  def edit
    @blog_post = BlogPost.friendly.find(params[:id])
  end

  def update
    if params[:publish] && current_admin
      @blog_post = BlogPost.friendly.find(params[:id])
      @blog_post.update(published?: true)
      @blog_posts_all = BlogPost.where(published?: true).friendly.includes(:admin).order(id: :desc).all
      flash[:success] = "Blog Post Successfully Published"
      render 'show'
    else
      blog_post = BlogPost.friendly.find(params[:id])
      blog_post.admin_id = current_admin.id
      if blog_post.update(blog_post_params)
        blog_post.blog_pics.each_with_index do |file, index|
          image_placeholder = "IMAGE#{index+1}"
          blog_post.content.sub!(image_placeholder, file.blog_pic.url)
        end
        if blog_post.save
          flash[:success] = "Updated Post should appear on this page."
          redirect_to blog_post_path(blog_post)
        else
          render 'edit'
        end
      else
        render 'edit'
      end
    end
  end

  def destroy
    BlogPost.friendly.find(params[:id]).destroy
    flash[:warning] = "Blog Post successfully deleted"
    redirect_to blog_posts_path
  end

  private

  def blog_post_params
    params.require(:blog_post).permit(:title, :admin_id, :posted_date, :content, blog_pics: [], blog_category_ids: [])
  end

  
end
