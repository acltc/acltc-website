class ContactsController < ApplicationController
  before_action :authenticate_admin!, except: [:new, :create]

  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
    render layout: 'main'
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      # AcltcMailer.contact_us_email(@contact).deliver_now
      redirect_to "/pages/contacts_thank_you"
    else
      render :new
    end
    # render layout: 'main'
  end

  def show
    @contact = Contact.find(params[:id])
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :subject, :phone, :message, :location)
  end

end
