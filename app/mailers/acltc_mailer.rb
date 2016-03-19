class AcltcMailer < ApplicationMailer
  default from: "hello@anyonecanlearntocode.com"

  def contact_us_email(contact)
    @contact = contact
    mail(from: @contact.email, to: "hello@anyonecanlearntocode.com", subject: 'Contact Us')
  end

  def application_email(application)
    @application = application
    mail(from: "appdb5c8c1f9bbf41eb997e36fdbb7df8d4.mailgun.org", to: 'ryan@anyonencanhaveawebsite.com', subject: 'Application Submitted', reply_to: @application.email )
  end

  def mini_course_application_email(mini_course_application)
    @mini_course_application = mini_course_application
    mail(from: "admissions@anyonecanlearntocode.com", to: @mini_course_application.email, subject: 'Mini Course Application Submission Successful', bcc: "mark@anyonecanlearntocode.com")
  end

end
