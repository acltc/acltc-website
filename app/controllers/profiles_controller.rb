class ProfilesController < ApplicationController
  def new
  end

  def create
    @profile = Profile.create(  
      gender: params[:gender], 
      age: params[:age],
      race: params[:race],
      times_applied: params[:times_applied],
      salary: params[:salary],
      credit_score: params[:credit_score],
      financial_network: params[:financial_network],
      savings: params[:savings],
      experience_in_coding: params[:experience_in_coding],
      readiness: params[:readiness],
      application_id: params[:application_id]
    )

    respond_to do |format|
        format.js {render :partial => "closeModal"}
    end
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update(
      gender: params[:gender], 
      age: params[:age],
      race: params[:race],
      times_applied: params[:times_applied],
      salary: params[:salary],
      credit_score: params[:credit_score],
      financial_network: params[:financial_network],
      savings: params[:savings],
      experience_in_coding: params[:experience_in_coding],
      readiness: params[:readiness]
    )

    respond_to do |format|
        format.js {render :partial => "closeModal"}
    end
  end

  def modal
    @application = Application.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end
end