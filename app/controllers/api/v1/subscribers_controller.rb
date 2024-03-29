class Api::V1::SubscribersController < ApplicationController

  def create_from_popup
    setup_subscriber
    if @subscriber.save
      create_hubspot_contact("Popup")
      subscriber_drip_setup
      render :nothing => true
    else
      render json: {errors: @subscriber.errors.full_messages}, status: 422 
    end
  end

  private

  def setup_subscriber
    @subscriber = Subscriber.new(email: params[:email], first_name: params[:first_name], phone: params[:phone], mousetrap: params[:mousetrap], ip_address: request.remote_ip)
    if request.location
      if city = request.location.city
        @subscriber.city = city
      end
      if state = request.location.state
        @subscriber.state = state
      end
      if postal_code = request.location.postal_code
        @subscriber.postal_code = postal_code
      end
    end
    return @subscriber
  end

  def subscriber_drip_setup
    client = Drip::Client.new do |c|
      c.api_key = ENV["DRIP_CLIENT_API_TOKEN"]
      c.account_id = ENV["DRIP_ACCOUNT_ID"]
    end

    cookies.permanent[:is_subscriber] = true
    client.create_or_update_subscriber(@subscriber.email, {custom_fields: {first_name: @subscriber.first_name, cell_phone: @subscriber.phone, mousetrap: @subscriber.mousetrap, city: @subscriber.city}})
    client.apply_tag(@subscriber.email, @subscriber.mousetrap)
    client.subscribe(@subscriber.email, 34197704)
    AcltcMailer.subscriber_mousetrap_email(@subscriber).deliver_now
  end

  def create_hubspot_contact(mousetrap_type)
    begin
      contact = Hubspot::Contact.find_by_email(@subscriber.email)
      if !contact
        Hubspot::Contact.create!(@subscriber.email, {firstname: @subscriber.first_name, phone: @subscriber.phone, lead_type: "Mousetrap", mousetrap: mousetrap_type, created_at: @subscriber.created_at})
      end  
    rescue Exception => e
      p "rescue #{e.message}"
    end
  end

end
