class AcltcMailer < ApplicationMailer
  default from: "hello@anyonecanlearntocode.com"

  def contact_us_email(contact)
    @contact = contact
    mail(from: @contact.email, to: "theonetrueemailtest@gmail.com", subject: 'Contact Us')
  end

  def corporate_training_message(corporate_training_message)
    @corporate_training_message = corporate_training_message
    mail(from: @corporate_training_message.contact_email, to: "theonetrueemailtest@gmail.com", subject: 'Corporate Training')
  end

  def corporate_training_message_reply(corporate_training_message)
    @corporate_training_message = corporate_training_message
    mail(from: "training@anyonecanlearntocode.com", to: "theonetrueemailtest@gmail.com", subject: 'Your Corporate Training Message To ACLTC')
  end

  def application_email(application)
    @application = application
    mail(from: "sandboxd035c758dbb54757b1b13d910d57a6b3.mailgun.org", to: 'theonetrueemailtest@gmail.com', subject: 'Application Submitted', reply_to: @application.email )
  end

  def application_email_reply(application)
    @application = application
    mail(from: "admissions@actualize.co", to: @application.email, subject: 'Your Application was Received')
  end

  def subscriber_mousetrap_email(subscriber)
    @subscriber = subscriber
    if @subscriber.state == "Illinois"
      mail(from: @subscriber.email, to: "theonetrueemailtest@gmail.com", subject: 'Illinois Mousetrap Activated')
    elsif @subscriber.state == "California"
      mail(from: @subscriber.email, to: "theonetrueemailtest@gmail.com", subject: 'California Mousetrap Activated')
    elsif @subscriber.state == "New York"
      mail(from: @subscriber.email, to: "theonetrueemailtest@gmail.com", subject: 'New York Mousetrap Activated')
    else
      mail(from: @subscriber.email, to: "theonetrueemailtest@gmail.com", subject: ' Mousetrap Activated')
    end
  end

  def tour_email(tour)
    @tour = tour
    mail(from: "sandboxd035c758dbb54757b1b13d910d57a6b3.mailgun.org", to: 'theonetrueemailtest@gmail.com', subject: 'Tour Scheduled', reply_to: @tour.email )
  end

  def tour_email_reply(tour)
    @tour = tour
    mail(from: "admissions@actualize.co", to: @tour.email, subject: 'Your Tour Request was Received')
  end

  def lakewood_application_email(application)
    @lakewood_application = application

    mail(from: "sandboxd035c758dbb54757b1b13d910d57a6b3.mailgun.org", to: 'theonetrueemailtest@gmail.com', subject: 'Lakewood Actualize Applicant', reply_to: @lakewood_application.email )
  end

  def mini_course_application_email(mini_course_application)
    @mini_course_application = mini_course_application
    mail(from: "admissions@anyonecanlearntocode.com", to: "theonetrueemailtest@gmail.com", subject: 'Mini Course Application Submission Successful', bcc: "mark@anyonecanlearntocode.com")
  end
end
