class K12ContactsController < ApplicationController
  def new
    @k12_contact = K12Contact.new
    render :layout => 'home_application'
  end

  def create
    @k12_contact.new(k12_contact_params)

    if @k12_contact.save
      redirect_to contacts_thank_you_path
    else
      flash[:warning] = "Message did not send"
      render :new
    end
  end

  private

    def k12_contact_params
      params.require(:k12_contact).permit(
        :first_name,
        :last_name,
        :email,
        :message
      )
    end

end
