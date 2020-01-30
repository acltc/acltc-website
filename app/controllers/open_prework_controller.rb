class OpenPreworkController < ApplicationController
  include CohortDatesHelper
  
  def index    
    @cohorts = @cohorts = upcoming_chicago_cohorts(cohort_start_dates, 4)
    render layout: 'main'
  end

  def enroll_form
    @coding_foundations_enrollment = CodingFoundationsEnrollment.new
    render layout: 'main'
  end

  def enroll
    @coding_foundations_enrollment = CodingFoundationsEnrollment.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], phone_number: params[:phone_number], paid: false)
    if @coding_foundations_enrollment.save
      # do some stripe stuff
    else
      p @coding_foundations_enrollment.errors.full_messages
      render 'enroll_form', layout: 'main'
    end
  end
end
