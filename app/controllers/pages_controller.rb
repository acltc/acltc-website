class PagesController < ApplicationController
  
  def home
    @info_session_sign_up = InfoSessionSignUp.new
    @current_info_session = InfoSession.current_info_session
    render :layout => 'home_application'
  end

  def thank_you

  end

  def contacts_thank_you

  end
  
end
