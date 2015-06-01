class BlogCategoriesController < ApplicationController

  def index
    @blog_categories = BlogCategory.all
  end

  def new
    @blog_category = BlogCategory.new
  end

end
