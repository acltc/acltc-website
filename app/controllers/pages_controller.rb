class PagesController < ApplicationController
  
  def home
    @current_info_session = InfoSession.current_info_session
    render :layout => 'home_application'
  end

  def thank_you

  end

  def contacts_thank_you

  end
  
end
