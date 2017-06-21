class PagesController < ApplicationController
  include CohortDatesHelper
  
  def home
    record_return_to_website_event
    @info_session_sign_up = InfoSessionSignUp.new
    @next_info_session = InfoSession.next_info_session
    @tour = Tour.new

    cohort_dates = cohort_start_dates

    cohort_dates.each do |cohort_date|
      if Time.zone.now <= cohort_date[:date] - 1.day
        @cohort_date = cohort_date[:date].strftime("%B %e, %Y")
        break
      else 
        @cohort_date = cohort_dates.first[:date].strftime("%B %e, %Y")
      end
    end
    
    render :layout => 'home_application'
  end

  def thank_you

  end

  def tour_thank_you

  end

  def contacts_thank_you

  end

  def privacy_policy

  end

  private
    def tour_params
      params.require(:tour).permit(
        :city,
        :first_name,
        :last_name,
        :email,
        :phone,
        :interview_id,
        :notes,
        :long
      )
    end

    def create_hubspot_contact
      begin
        lower_levels = ["Mousetrap", "Info Session"]
        contact = Hubspot::Contact.find_by_email(tour_params[:email])
        if contact
          if lower_levels.include?(contact["lead_type"])
            contact.update!({lead_type: "Tour"})
          end
        else
          Hubspot::Contact.create!(tour_params[:email], {firstname: tour_params[:first_name], lastname: tour_params[:last_name], phone: tour_params[:phone], lead_type: "Tour", created_at: @tour.created_at })
        end
      rescue Exception => e
        p "rescue #{e.message}"
      end
    end
  
end
