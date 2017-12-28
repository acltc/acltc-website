class AcltcMailer < ApplicationMailer
  default from: "hello@anyonecanlearntocode.com"

  def contact_us_email(contact)
    @contact = contact
    mail(from: @contact.email, to: "hello@anyonecanlearntocode.com", subject: 'Contact Us')
  end

  def complete_your_application_reminder(first_name, email, phone)
    @first_name = first_name
    @email = email
    @phone = phone
    mail(from: "admissions@actualize.co", to: @email, subject: 'You\'re almost done applying to Actualize', reply_to: "admissions@actualize.co", bcc: ["operations@actualize.co", "jay@actualize.co"])
  end

  def corporate_training_message(corporate_training_message)
    @corporate_training_message = corporate_training_message
    mail(from: @corporate_training_message.contact_email, to: "zev@anyonecanlearntocode.com", subject: 'Corporate Training')
  end

  def corporate_training_message_reply(corporate_training_message)
    @corporate_training_message = corporate_training_message
    mail(from: "training@anyonecanlearntocode.com", to: @corporate_training_message.contact_email, subject: 'Your Corporate Training Message To ACLTC')
  end

  def application_email(application)
    @application = application
    mail(from: "admissions@actualize.co", to: 'admissions@anyonecanlearntocode.com', subject: 'Application Submitted', reply_to: @application.email)
  end

  def application_email_reply(application)
    @application = application
    mail(from: "admissions@actualize.co", to: @application.email, subject: 'Your Application was Received')
  end

  def subscriber_mousetrap_email(subscriber)
    @subscriber = subscriber
    mail(from: @subscriber.email, to: ["ben@actualize.co", "jay@actualize.co", "rena@actualize.co"], subject: 'Mousetrap Activated')

    # if @subscriber.state == "Illinois"
    #   mail(from: @subscriber.email, to: "nick@anyonecanlearntocode.com", subject: 'Illinois Mousetrap Activated')
    # elsif @subscriber.state == "California"
    #   mail(from: @subscriber.email, to: "zev@anyonecanlearntocode.com", subject: 'California Mousetrap Activated')
    # elsif @subscriber.state == "New York" || @subscriber.state == "New Jersey" || @subscriber.state == "Connecticut" || @subscriber.state == "Massachusetts" || @subscriber.state == "Pennsylvania" || @subscriber.state == "Vermont" || @subscriber.state == "New Hampshire" || @subscriber.state == "Rhode Island"
    #   mail(from: @subscriber.email, to: "sal@anyonecanlearntocode.com", subject: 'New York Area Mousetrap Activated')
    # else
    #   mail(from: @subscriber.email, to: "admissions@actualize.co", subject: ' Mousetrap Activated')
    # end
  end

  def tour_email(tour, city, state, zip, ip)
    @tour = tour
    @tour_city = city
    @tour_state = state
    @tour_postal_code = zip
    @tour_ip_address = ip
    mail(from: "admissions@actualize.co", to: ["ben@actualize.co", "jay@actualize.co", "rena@actualize.co"], subject: 'Tour Scheduled', reply_to: @tour.email )
  end

  def tour_email_reply(tour)
    @tour = tour
    mail(from: "admissions@actualize.co", to: @tour.email, subject: 'Your Tour Request was Received')
  end

  def lakewood_application_email(application)
    @lakewood_application = application
    mail(from: "admissions@actualize.co", to: ['zev@actualize.co', 'ben@thedifferenceengine.io'], subject: 'Lakewood Actualize Applicant', reply_to: @lakewood_application.email )
  end

  def mini_course_application_email(mini_course_application)
    @mini_course_application = mini_course_application
    mail(from: "admissions@anyonecanlearntocode.com", to: @mini_course_application.email, subject: 'Mini Course Application Submission Successful', bcc: "mark@anyonecanlearntocode.com")
  end

  def info_session_sign_up_email(info_session_sign_up)
    @info_session_sign_up = info_session_sign_up

    if @info_session_sign_up.city == "Chicago"
      @city_advisor = "nick@anyonecanlearntocode.com"
    elsif @info_session_sign_up.city == "New York City"
      @city_advisor = "zev@anyonecanlearntocode.com"
    else
      @city_advisor = "ray@actualize.co"
    end
    mail(from: "admissions@actualize.co", to: ["ben@actualize.co", "jay@actualize.co", @city_advisor], subject: "New Info Session Sign Up")
  end

  def info_session_sign_up_confirmation_email(info_session_sign_up)
    @info_session_sign_up = info_session_sign_up
    mail(from: "admissions@actualize.co", to: @info_session_sign_up.email, subject: "Your Actualize Info Session Has Been Scheduled")
  end

  def info_session_cancel(info_session, user_email)
    @info_session = info_session
    mail(from: "admissions@actualize.co", to: user_email, subject: "Your Actualize Info Session Has Been Canceled")
  end

  def referral_email(referral, email_body)
    @referral = referral
    @email_body = email_body
    mail(from: @referral.referrer_email, to: @referral.referred_email, cc: "ben@actualize.co", bcc: [@referral.referrer_email, "jay@actualize.co", "rena@actualize.co"], subject: "Intro to Actualize")
  end

end