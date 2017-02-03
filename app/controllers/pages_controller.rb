class PagesController < ApplicationController
  include CohortDatesHelper
  
  def home
    @info_session_sign_up = InfoSessionSignUp.new
    @current_info_session = InfoSession.current_info_session

    cohort_dates = cohort_start_dates

    cohort_dates.each do |cohort_date|
      if Time.zone.now <= cohort_date[:date] - 1.week
        @cohort_date = cohort_date[:date].strftime("%B %e, %Y")
        break
      else 
        @cohort_date = cohort_dates.first[:date].strftime("%B %e, %Y")
      end
    end

    render :layout => 'home_application'
  end

  def thank_you

  end

  def contacts_thank_you

  end
  
end