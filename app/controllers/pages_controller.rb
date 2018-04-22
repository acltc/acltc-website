class PagesController < ApplicationController
  NUMBER_OF_DAYS_BEFORE_IN_CLASS_START_DATE_TO_ACCEPT_STUDENTS = 17
  NUMBER_OF_DAYS_BEFORE_PREWORK_START_DATE_OFFER_EARLY_BIRD_DISCOUNT = 30

  include CohortDatesHelper
  
  def home
    track_web_traffic_source
    render layout: 'main'
  end

  def in_person
    track_web_traffic_source
    @cohorts = []
    next_cohort_info = enrolling_cohort_info(cohort_start_dates)
    @cohorts << {
      start_date: next_cohort_info[:start_date],
      early_bird_deadline: next_cohort_info[:early_bird_deadline]
    }
    render layout: 'main'
  end

  def online
    track_web_traffic_source
    @cohorts = []
    online_cohort_start_dates_east = online_cohort_start_dates.select { |val| val[:location] == "east" }
    next_cohort_info_east = enrolling_cohort_info(online_cohort_start_dates_east)
    @cohorts << {
      name: "Central time zone",
      start_date: next_cohort_info_east[:start_date],
      early_bird_deadline: next_cohort_info_east[:early_bird_deadline]
    }
    online_cohort_start_dates_west = online_cohort_start_dates.select { |val| val[:location] == "west" }
    next_cohort_info_west = enrolling_cohort_info(online_cohort_start_dates_west)
    @cohorts << {
      name: "Pacific time zone",
      start_date: next_cohort_info_west[:start_date],
      early_bird_deadline: next_cohort_info_west[:early_bird_deadline]
    }
    @cohorts = @cohorts.sort_by { |cohort| cohort[:start_date] }
    render layout: 'main'
  end

  def communities
    cities = {
      'boise-idaho' => {
        city: 'Boise',
        state: 'Idaho',
        state_abbr: "ID",
        meetups: [{name: "Boise Web Technologies Group", url: "https://www.meetup.com/boisewebtechs/"}, {name: "Boise Software Developer's Group", url: "https://www.meetup.com/bsdg-meetup/"}, {name: "Girl Develop It Boise", url: "https://www.meetup.com/Girl-Develop-It-Boise/"}]
        # average_monthly_living_cost: 2000,
        # average_yearly_salary: 40000,
        # bootcamps: [
        #   {
        #     name: 'General Assembly',
        #     tuition: 13500,
        #     weeks: 12
        #   },
        #   {
        #     name: 'Fullstack',
        #     tuition: 15700,
        #     weeks: 21
        #   },
        #   {
        #     name: 'Hack Reactor Remote Beta',
        #     tuition: 17800,
        #     weeks: 12
        #   }
        # ]
      },
      'new-york-city' => {
        city: 'New York City',
        state: 'New York',
        state_abbr: "NY",
        meetups: []
      }
    }
    city_info = cities["#{params[:location]}"]
    @city = city_info[:city]
    @state = city_info[:state]
    @state_abbr = city_info[:state_abbr]
    @meetups = city_info[:meetups]
    @tuition_actualize = 9500

    render layout: 'main'
  end

  def thank_you
    render layout: 'main'
  end

  def webinar_thank_you
    render layout: 'main'
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
        start_date: final_cohort_info[:date],
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
      if cohort_info[:early_bird_date]
        early_bird_deadline = cohort_info[:early_bird_date]
      else
        early_bird_deadline = cohort_info[:date] - NUMBER_OF_DAYS_BEFORE_PREWORK_START_DATE_OFFER_EARLY_BIRD_DISCOUNT.days
      end
      if cohort_info[:prework] && Time.zone.now <= early_bird_deadline
        early_bird_deadline = early_bird_deadline
      else
        early_bird_deadline = nil
      end
    end
end
