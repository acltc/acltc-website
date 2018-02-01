class TechSavvyArticlesController < ApplicationController
  def index
    render layout: 'main'
  end

  def show
    render "/tech_savvy_articles/#{params[:title]}", layout: 'main'
  end
end
