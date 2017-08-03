class PagesController < ApplicationController
  NUMBER_OF_DAYS_BEFORE_IN_CLASS_START_DATE_TO_ACCEPT_STUDENTS = 17
  NUMBER_OF_DAYS_BEFORE_PREWORK_START_DATE_OFFER_EARLY_BIRD_DISCOUNT = 30

  include CohortDatesHelper
  
  def home
    render layout: 'main'
  end

  def in_person
    next_cohort_info = enrolling_cohort_info(cohort_start_dates)
    @cohort_date = next_cohort_info[:formatted_date]
    @early_bird_deadline = next_cohort_info[:early_bird_deadline]
    render layout: 'main'
  end

  def online
    next_cohort_info = enrolling_cohort_info(online_cohort_start_dates)
    @cohort_date = next_cohort_info[:formatted_date]
    @early_bird_deadline = next_cohort_info[:early_bird_deadline]
    render layout: 'main'
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
  
    def enrolling_cohort_info(cohort_infos)
      final_cohort_info = find_next_cohort(cohort_infos)
      {
        formatted_date: final_cohort_info[:date].strftime("%B %e, %Y"),
        early_bird_deadline: compute_early_bird_deadline(final_cohort_info)
      } 
    end

    def find_next_cohort(cohort_infos)
      final_cohort_info = nil
      cohort_infos.each do |cohort_info|
        if cohort_info[:prework] && Time.zone.now <= cohort_info[:date] - 1.days
          final_cohort_info = cohort_info
          break
        elsif !cohort_info[:prework] && Time.zone.now <= cohort_info[:date] - NUMBER_OF_DAYS_BEFORE_IN_CLASS_START_DATE_TO_ACCEPT_STUDENTS.days
          final_cohort_info = cohort_info
          break
        else
          final_cohort_info = cohort_infos.first
        end
      end
      final_cohort_info
    end

    def compute_early_bird_deadline(cohort_info)
      early_bird_deadline = cohort_info[:date] - NUMBER_OF_DAYS_BEFORE_PREWORK_START_DATE_OFFER_EARLY_BIRD_DISCOUNT.days
      if cohort_info[:prework] && Time.zone.now <= early_bird_deadline
        early_bird_deadline = early_bird_deadline.strftime("%B %e")
      else
        early_bird_deadline = nil
      end
    end
end
