class AcltcMailer < ApplicationMailer
  default from: "info@anyonecanlearntocode.com"

  def contact_us_email(contact)
    @contact = contact
    mail(from: "hello@anyonecanlearntocode.com", to: @contact.email, subject: 'Thanks for Contacting Us!', bcc: "mark@anyonecanlearntocode.com")
  end

  def application_email(application)
    @application = application
    mail(from: "admissions@anyonecanlearntocode.com", to: @application.email, subject: 'Application Submission Successful', bcc: "mark@anyonecanlearntocode.com")
  end
end
