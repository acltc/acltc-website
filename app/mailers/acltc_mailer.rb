class AcltcMailer < ApplicationMailer
  default from: "hello@anyonecanlearntocode.com"

  def contact_us_email(contact)
    @contact = contact
    mail(from: @contact.email, to: "hello@anyonecanlearntocode.com", subject: 'Contact Us')
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
    mail(from: "sandboxd035c758dbb54757b1b13d910d57a6b3.mailgun.org", to: 'admissions@anyonecanlearntocode.com', subject: 'Application Submitted', reply_to: @application.email )
  end

  def mini_course_application_email(mini_course_application)
    @mini_course_application = mini_course_application
    mail(from: "admissions@anyonecanlearntocode.com", to: @mini_course_application.email, subject: 'Mini Course Application Submission Successful', bcc: "mark@anyonecanlearntocode.com")
  end
end
