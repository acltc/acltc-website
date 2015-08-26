class AcltcMailer < ApplicationMailer
  default from: "hello@anyonecanlearntocode.com"

  def contact_us_email(contact)
    @contact = contact
    mail(from: @contact.email, to: "hello@anyonecanlearntocode.com", subject: 'Contact Us')
  end

  def application_email(application)
    @application = application
    mail(from: "admissions@anyonecanlearntocode.com", to: @application.email, subject: 'Application Submission Successful', bcc: "mark@anyonecanlearntocode.com")
  end

  def mini_course_application_email(mini_course_application)
    @mini_course_application = mini_course_application
    mail(from: "admissions@anyonecanlearntocode.com", to: @mini_course_application.email, subject: 'Mini Course Application Submission Successful', bcc: "mark@anyonecanlearntocode.com")
  end

end
