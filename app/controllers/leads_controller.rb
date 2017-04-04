class LeadsController < ApplicationController
  def new
    @lead = Lead.new
  end

  def create
    @lead = Lead.new(
      first_name: params[:first_name],
      email: params[:email],
      phone: params[:phone],
      event: params[:event]
    )

    Unirest.post("http://localhost:3000/api/v1/leads.json", headers: {
    "Accept" => "application/json", "Content-Type" => "application/json"},
     parameters: {:first_name => params[:first_name], :email => params[:email], :phone => params[:phone], :name => params[:event], :ip => request.remote_ip }).body
  end

end
