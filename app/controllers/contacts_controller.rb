class ContactsController < ApplicationController
  before_action :authenticate_admin!, except: [:new, :create]

  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      AcltcMailer.contact_us_email(@contact).deliver_now
      flash[:success] = "Message sent. You should receive a confirmation message shortly."
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @contact = Contact.find(params[:id])
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :subject, :phone, :message, :location_ids => [])
  end

end
