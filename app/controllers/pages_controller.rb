class PagesController < ApplicationController
  def home
    render :layout => 'home_application'
  end
end
