class PagesController < ApplicationController
  
  def home
    @info_session_sign_up = InfoSessionSignUp.new
    @current_info_session = InfoSession.current_info_session

    cohort_dates = [
      Date.new(2017, 1, 22),
      Date.new(2017, 2, 26),
      Date.new(2017, 3, 26),
      Date.new(2017, 4, 23),
      Date.new(2017, 5, 28),
      Date.new(2017, 6, 25),
      Date.new(2017, 7, 23),
      Date.new(2017, 8, 20,
      Date.new(2017, 9, 17),
      Date.new(2017, 10, 15),
      Date.new(2017, 11, 19),
      Date.new(2017, 12, 17)
    ]

   
    render :layout => 'home_application'
  end

  def thank_you

  end

  def contacts_thank_you

  end
  
end