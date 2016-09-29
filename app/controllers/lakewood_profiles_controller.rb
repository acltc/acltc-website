class LakewoodProfilesController < ApplicationController
  def new
  end

  def create
    @lakewood_profile = LakewoodProfile.new(
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
      lakewood_application_id: params[:lakewood_application_id]
    )

    if @lakewood_profile.save 
      respond_to do |format|
        format.js {render :partial => "closeModal"}
      end
    else
      respond_to do |format|
        format.js {render :partial => "modal"}
      end
    end
  end

  def update
    @lakewood_profile = LakewoodProfile.find(params[:id])
    @lakewood_profile.update(
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
    @lakewood_application = LakewoodApplication.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end
end
