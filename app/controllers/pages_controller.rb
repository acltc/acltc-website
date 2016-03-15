class PagesController < ApplicationController
  def home
    render :layout => 'home_application'
  end

  def show
    render template: "pages/#{params[:page]}"
  end
end
