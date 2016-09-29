class LakewoodProfilesController < ApplicationController
  def new
  end

  def create
    @lakewood_profile = LakewoodProfile.new(lakewood_profile_params)

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
    @lakewood_profile.update(lakewood_profile_params)

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

  private

  def lakewood_profile_params
    params.require(:lakewood_profile).permit(
      :gender, 
      :age,
      :race,
      :times_applied,
      :salary,
      :credit_score,
      :financial_network,
      :savings,
      :experience_in_coding,
      :readiness,
      :lakewood_application_id
    )
  end
end
