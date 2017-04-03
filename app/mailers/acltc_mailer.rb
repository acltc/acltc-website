class AcltcMailer < ApplicationMailer
  default from: "hello@anyonecanlearntocode.com"

  def contact_us_email(contact)
    @contact = contact
    mail(from: @contact.email, to: "ryan@thedifferenceengine.io", subject: 'Contact Us')
  end

  def corporate_training_message(corporate_training_message)
    @corporate_training_message = corporate_training_message
    mail(from: @corporate_training_message.contact_email, to: "ryan@thedifferenceengine.io", subject: 'Corporate Training')
  end

  def corporate_training_message_reply(corporate_training_message)
    @corporate_training_message = corporate_training_message
    mail(from: "training@anyonecanlearntocode.com", to: "ryan@thedifferenceengine.io", subject: 'Your Corporate Training Message To ACLTC')
  end

  def application_email(application)
    @application = application
    mail(from: "mg.anyonecanlearntocode.com", to: 'ryan@thedifferenceengine.io', subject: 'Application Submitted', reply_to: @application.email )
  end

  def application_email_reply(application)
    @application = application
    mail(from: "admissions@actualize.co", to: "ryan@thedifferenceengine.io", subject: 'Your Application was Received')
  end

  def subscriber_mousetrap_email(subscriber)
    @subscriber = subscriber
    mail(from: @subscriber.email, to: "ryan@thedifferenceengine.io", subject: 'Mousetrap Activated')

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
    mail(from: "mg.anyonecanlearntocode.com", to: "ryan@thedifferenceengine.io", subject: 'Tour Scheduled', reply_to: @tour.email )
  end

  def tour_email_reply(tour)
    @tour = tour
    mail(from: "admissions@actualize.co", to: "ryan@thedifferenceengine.io", subject: 'Your Tour Request was Received')
  end

  def lakewood_application_email(application)
    @lakewood_application = application
    mail(from: "mg.anyonecanlearntocode.com", to: "ryan@thedifferenceengine.io", subject: 'Lakewood Actualize Applicant', reply_to: @lakewood_application.email )
  end

  def mini_course_application_email(mini_course_application)
    @mini_course_application = mini_course_application
    mail(from: "admissions@anyonecanlearntocode.com", to: "ryan@thedifferenceengine.io", subject: 'Mini Course Application Submission Successful', bcc: "mark@anyonecanlearntocode.com")
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
    mail(from: "mg.anyonecanlearntocode.com", to: "ryan@thedifferenceengine.io", subject: "New Info Session Sign Up")
  end

  def info_session_sign_up_confirmation_email(info_session_sign_up)
    @info_session_sign_up = info_session_sign_up
    mail(from: "admissions@actualize.co", to: "ryan@thedifferenceengine.io", subject: "Your Actualize Info Session Has Been Scheduled")
  end

  def info_session_cancel(info_session, user_email)
    @info_session = info_session
    mail(from: "admissions@actualize.co", to: "ryan@thedifferenceengine.io", subject: "Your Actualize Info Session Has Been Canceled")
  end

  def referral_email(referral, email_body)
    @referral = referral
    @email_body = email_body
    mail(from: @referral.referrer_email, to: "ryan@thedifferenceengine.io", cc: "ben@actualize.co", bcc: [@referral.referrer_email, "jay@actualize.co", "rena@actualize.co"], subject: "Intro to Actualize")
  end

end