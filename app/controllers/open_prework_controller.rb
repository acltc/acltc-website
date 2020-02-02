class OpenPreworkController < ApplicationController
  include CohortDatesHelper
  
  def index    
    @cohorts = @cohorts = upcoming_chicago_cohorts(cohort_start_dates, 4)
    render layout: 'main'
  end

  def enroll_form
    Stripe.api_key = ENV['STRIPE_KEY']

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: 'Coding Foundations',
        description: 'Introduction to Coding Foundations',
        images: ['https://anyonecanlearntocode.com/assets/actualize-logo-158d4b4cceb72d78f91dbd8bde4eabb9c71a2eba651c10dbc5d4cbf6c96c3afa.png'],
        amount: 50000,
        currency: 'usd',
        quantity: 1,
      }],
      success_url: 'https://anyonecanlearntocode.com/enroll/email?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: 'https://anyonecanlearntocode.com/enroll/coding_foundations',
    )
    @session_id = session['id']
    
    @coding_foundations_enrollment = CodingFoundationsEnrollment.new
    
    render layout: 'main'
  end

  def enroll
    @coding_foundations_enrollment = CodingFoundationsEnrollment.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], phone_number: params[:phone_number], paid: false, session_id: params[:session_id])
    if @coding_foundations_enrollment.save
      # do some stripe stuff
      # redirect_to '/enroll/charge', layout: 'main'
      render json: {message: "success"}
    else
      p @coding_foundations_enrollment.errors.full_messages
      # render 'enroll_form', layout: 'main'
      render json: {errors: @coding_foundations_enrollment.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def email
    # find user based on session id
    # send peter email so he can add them
    @student = CodingFoundationsEnrollment.find_by(session_id: params[:session_id])
    @student.update(paid: true)
    # send peter an email so that he can add them to prework
    AcltcMailer.coding_foundations_email(@student).deliver_now
    redirect_to "/coding_foundations/thank_you"
  end

  def thank_you
    render layout: 'main'
  end
end
