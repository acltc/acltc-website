class PagesController < ApplicationController
  NUMBER_OF_DAYS_BEFORE_IN_CLASS_START_DATE_TO_ACCEPT_STUDENTS = 17
  NUMBER_OF_DAYS_BEFORE_PREWORK_START_DATE_OFFER_EARLY_BIRD_DISCOUNT = 30

  CITIES = {"new-york-new-york"=>{:city=>"New York", :state=>"New York"}, "los-angeles-california"=>{:city=>"Los Angeles", :state=>"California"}, "chicago-illinois"=>{:city=>"Chicago", :state=>"Illinois"}, "houston-texas"=>{:city=>"Houston", :state=>"Texas"}, "philadelphia-pennsylvania"=>{:city=>"Philadelphia", :state=>"Pennsylvania"}, "phoenix-arizona"=>{:city=>"Phoenix", :state=>"Arizona"}, "san-antonio-texas"=>{:city=>"San Antonio", :state=>"Texas"}, "san-diego-california"=>{:city=>"San Diego", :state=>"California"}, "dallas-texas"=>{:city=>"Dallas", :state=>"Texas"}, "san-jose-california"=>{:city=>"San Jose", :state=>"California"}, "austin-texas"=>{:city=>"Austin", :state=>"Texas"}, "indianapolis-indiana"=>{:city=>"Indianapolis", :state=>"Indiana"}, "jacksonville-florida"=>{:city=>"Jacksonville", :state=>"Florida"}, "san-francisco-california"=>{:city=>"San Francisco", :state=>"California"}, "columbus-ohio"=>{:city=>"Columbus", :state=>"Ohio"}, "charlotte-north-carolina"=>{:city=>"Charlotte", :state=>"North Carolina"}, "fort-worth-texas"=>{:city=>"Fort Worth", :state=>"Texas"}, "detroit-michigan"=>{:city=>"Detroit", :state=>"Michigan"}, "el-paso-texas"=>{:city=>"El Paso", :state=>"Texas"}, "memphis-tennessee"=>{:city=>"Memphis", :state=>"Tennessee"}, "seattle-washington"=>{:city=>"Seattle", :state=>"Washington"}, "denver-colorado"=>{:city=>"Denver", :state=>"Colorado"}, "washington-district-of-columbia"=>{:city=>"Washington", :state=>"District of Columbia"}, "boston-massachusetts"=>{:city=>"Boston", :state=>"Massachusetts"}, "nashville-davidson-tennessee"=>{:city=>"Nashville-Davidson", :state=>"Tennessee"}, "baltimore-maryland"=>{:city=>"Baltimore", :state=>"Maryland"}, "oklahoma-city-oklahoma"=>{:city=>"Oklahoma City", :state=>"Oklahoma"}, "louisville/jefferson-county-kentucky"=>{:city=>"Louisville/Jefferson County", :state=>"Kentucky"}, "portland-oregon"=>{:city=>"Portland", :state=>"Oregon"}, "las-vegas-nevada"=>{:city=>"Las Vegas", :state=>"Nevada"}, "milwaukee-wisconsin"=>{:city=>"Milwaukee", :state=>"Wisconsin"}, "albuquerque-new-mexico"=>{:city=>"Albuquerque", :state=>"New Mexico"}, "tucson-arizona"=>{:city=>"Tucson", :state=>"Arizona"}, "fresno-california"=>{:city=>"Fresno", :state=>"California"}, "sacramento-california"=>{:city=>"Sacramento", :state=>"California"}, "long-beach-california"=>{:city=>"Long Beach", :state=>"California"}, "kansas-city-missouri"=>{:city=>"Kansas City", :state=>"Missouri"}, "mesa-arizona"=>{:city=>"Mesa", :state=>"Arizona"}, "virginia-beach-virginia"=>{:city=>"Virginia Beach", :state=>"Virginia"}, "atlanta-georgia"=>{:city=>"Atlanta", :state=>"Georgia"}, "colorado-springs-colorado"=>{:city=>"Colorado Springs", :state=>"Colorado"}, "omaha-nebraska"=>{:city=>"Omaha", :state=>"Nebraska"}, "raleigh-north-carolina"=>{:city=>"Raleigh", :state=>"North Carolina"}, "miami-florida"=>{:city=>"Miami", :state=>"Florida"}, "oakland-california"=>{:city=>"Oakland", :state=>"California"}, "minneapolis-minnesota"=>{:city=>"Minneapolis", :state=>"Minnesota"}, "tulsa-oklahoma"=>{:city=>"Tulsa", :state=>"Oklahoma"}, "cleveland-ohio"=>{:city=>"Cleveland", :state=>"Ohio"}, "wichita-kansas"=>{:city=>"Wichita", :state=>"Kansas"}, "arlington-texas"=>{:city=>"Arlington", :state=>"Texas"}, "new-orleans-louisiana"=>{:city=>"New Orleans", :state=>"Louisiana"}, "bakersfield-california"=>{:city=>"Bakersfield", :state=>"California"}, "tampa-florida"=>{:city=>"Tampa", :state=>"Florida"}, "honolulu-hawaii"=>{:city=>"Honolulu", :state=>"Hawaii"}, "aurora-colorado"=>{:city=>"Aurora", :state=>"Colorado"}, "anaheim-california"=>{:city=>"Anaheim", :state=>"California"}, "santa-ana-california"=>{:city=>"Santa Ana", :state=>"California"}, "st-louis-missouri"=>{:city=>"St. Louis", :state=>"Missouri"}, "riverside-california"=>{:city=>"Riverside", :state=>"California"}, "corpus-christi-texas"=>{:city=>"Corpus Christi", :state=>"Texas"}, "lexington-fayette-kentucky"=>{:city=>"Lexington-Fayette", :state=>"Kentucky"}, "pittsburgh-pennsylvania"=>{:city=>"Pittsburgh", :state=>"Pennsylvania"}, "anchorage-alaska"=>{:city=>"Anchorage", :state=>"Alaska"}, "stockton-california"=>{:city=>"Stockton", :state=>"California"}, "cincinnati-ohio"=>{:city=>"Cincinnati", :state=>"Ohio"}, "st-paul-minnesota"=>{:city=>"St. Paul", :state=>"Minnesota"}, "toledo-ohio"=>{:city=>"Toledo", :state=>"Ohio"}, "greensboro-north-carolina"=>{:city=>"Greensboro", :state=>"North Carolina"}, "newark-new-jersey"=>{:city=>"Newark", :state=>"New Jersey"}, "plano-texas"=>{:city=>"Plano", :state=>"Texas"}, "henderson-nevada"=>{:city=>"Henderson", :state=>"Nevada"}, "lincoln-nebraska"=>{:city=>"Lincoln", :state=>"Nebraska"}, "buffalo-new-york"=>{:city=>"Buffalo", :state=>"New York"}, "jersey-city-new-jersey"=>{:city=>"Jersey City", :state=>"New Jersey"}, "chula-vista-california"=>{:city=>"Chula Vista", :state=>"California"}, "fort-wayne-indiana"=>{:city=>"Fort Wayne", :state=>"Indiana"}, "orlando-florida"=>{:city=>"Orlando", :state=>"Florida"}, "st-petersburg-florida"=>{:city=>"St. Petersburg", :state=>"Florida"}, "chandler-arizona"=>{:city=>"Chandler", :state=>"Arizona"}, "laredo-texas"=>{:city=>"Laredo", :state=>"Texas"}, "norfolk-virginia"=>{:city=>"Norfolk", :state=>"Virginia"}, "durham-north-carolina"=>{:city=>"Durham", :state=>"North Carolina"}, "madison-wisconsin"=>{:city=>"Madison", :state=>"Wisconsin"}, "lubbock-texas"=>{:city=>"Lubbock", :state=>"Texas"}, "irvine-california"=>{:city=>"Irvine", :state=>"California"}, "winston-salem-north-carolina"=>{:city=>"Winston-Salem", :state=>"North Carolina"}, "glendale-arizona"=>{:city=>"Glendale", :state=>"Arizona"}, "garland-texas"=>{:city=>"Garland", :state=>"Texas"}, "hialeah-florida"=>{:city=>"Hialeah", :state=>"Florida"}, "reno-nevada"=>{:city=>"Reno", :state=>"Nevada"}, "chesapeake-virginia"=>{:city=>"Chesapeake", :state=>"Virginia"}, "gilbert-arizona"=>{:city=>"Gilbert", :state=>"Arizona"}, "baton-rouge-louisiana"=>{:city=>"Baton Rouge", :state=>"Louisiana"}, "irving-texas"=>{:city=>"Irving", :state=>"Texas"}, "scottsdale-arizona"=>{:city=>"Scottsdale", :state=>"Arizona"}, "north-las-vegas-nevada"=>{:city=>"North Las Vegas", :state=>"Nevada"}, "fremont-california"=>{:city=>"Fremont", :state=>"California"}, "boise-idaho"=>{:city=>"Boise", :state=>"Idaho"}, "richmond-virginia"=>{:city=>"Richmond", :state=>"Virginia"}, "san-bernardino-california"=>{:city=>"San Bernardino", :state=>"California"}, "birmingham-alabama"=>{:city=>"Birmingham", :state=>"Alabama"}, "spokane-washington"=>{:city=>"Spokane", :state=>"Washington"}, "rochester-new-york"=>{:city=>"Rochester", :state=>"New York"}, "des-moines-iowa"=>{:city=>"Des Moines", :state=>"Iowa"}, "modesto-california"=>{:city=>"Modesto", :state=>"California"}, "fayetteville-north-carolina"=>{:city=>"Fayetteville", :state=>"North Carolina"}, "tacoma-washington"=>{:city=>"Tacoma", :state=>"Washington"}, "oxnard-california"=>{:city=>"Oxnard", :state=>"California"}, "fontana-california"=>{:city=>"Fontana", :state=>"California"}, "columbus-georgia"=>{:city=>"Columbus", :state=>"Georgia"}, "montgomery-alabama"=>{:city=>"Montgomery", :state=>"Alabama"}, "moreno-valley-california"=>{:city=>"Moreno Valley", :state=>"California"}, "shreveport-louisiana"=>{:city=>"Shreveport", :state=>"Louisiana"}, "aurora-illinois"=>{:city=>"Aurora", :state=>"Illinois"}, "yonkers-new-york"=>{:city=>"Yonkers", :state=>"New York"}, "akron-ohio"=>{:city=>"Akron", :state=>"Ohio"}, "huntington-beach-california"=>{:city=>"Huntington Beach", :state=>"California"}, "little-rock-arkansas"=>{:city=>"Little Rock", :state=>"Arkansas"}, "augusta-richmond-county-georgia"=>{:city=>"Augusta-Richmond County", :state=>"Georgia"}, "amarillo-texas"=>{:city=>"Amarillo", :state=>"Texas"}, "glendale-california"=>{:city=>"Glendale", :state=>"California"}, "mobile-alabama"=>{:city=>"Mobile", :state=>"Alabama"}, "grand-rapids-michigan"=>{:city=>"Grand Rapids", :state=>"Michigan"}, "salt-lake-city-utah"=>{:city=>"Salt Lake City", :state=>"Utah"}, "tallahassee-florida"=>{:city=>"Tallahassee", :state=>"Florida"}, "huntsville-alabama"=>{:city=>"Huntsville", :state=>"Alabama"}, "grand-prairie-texas"=>{:city=>"Grand Prairie", :state=>"Texas"}, "knoxville-tennessee"=>{:city=>"Knoxville", :state=>"Tennessee"}, "worcester-massachusetts"=>{:city=>"Worcester", :state=>"Massachusetts"}, "newport-news-virginia"=>{:city=>"Newport News", :state=>"Virginia"}, "brownsville-texas"=>{:city=>"Brownsville", :state=>"Texas"}, "overland-park-kansas"=>{:city=>"Overland Park", :state=>"Kansas"}, "santa-clarita-california"=>{:city=>"Santa Clarita", :state=>"California"}, "providence-rhode-island"=>{:city=>"Providence", :state=>"Rhode Island"}, "garden-grove-california"=>{:city=>"Garden Grove", :state=>"California"}, "chattanooga-tennessee"=>{:city=>"Chattanooga", :state=>"Tennessee"}, "oceanside-california"=>{:city=>"Oceanside", :state=>"California"}, "jackson-mississippi"=>{:city=>"Jackson", :state=>"Mississippi"}, "fort-lauderdale-florida"=>{:city=>"Fort Lauderdale", :state=>"Florida"}, "santa-rosa-california"=>{:city=>"Santa Rosa", :state=>"California"}, "rancho-cucamonga-california"=>{:city=>"Rancho Cucamonga", :state=>"California"}, "port-st-lucie-florida"=>{:city=>"Port St. Lucie", :state=>"Florida"}, "tempe-arizona"=>{:city=>"Tempe", :state=>"Arizona"}, "ontario-california"=>{:city=>"Ontario", :state=>"California"}, "vancouver-washington"=>{:city=>"Vancouver", :state=>"Washington"}, "cape-coral-florida"=>{:city=>"Cape Coral", :state=>"Florida"}, "sioux-falls-south-dakota"=>{:city=>"Sioux Falls", :state=>"South Dakota"}, "springfield-missouri"=>{:city=>"Springfield", :state=>"Missouri"}, "peoria-arizona"=>{:city=>"Peoria", :state=>"Arizona"}, "pembroke-pines-florida"=>{:city=>"Pembroke Pines", :state=>"Florida"}, "elk-grove-california"=>{:city=>"Elk Grove", :state=>"California"}, "salem-oregon"=>{:city=>"Salem", :state=>"Oregon"}, "lancaster-california"=>{:city=>"Lancaster", :state=>"California"}, "corona-california"=>{:city=>"Corona", :state=>"California"}, "eugene-oregon"=>{:city=>"Eugene", :state=>"Oregon"}, "palmdale-california"=>{:city=>"Palmdale", :state=>"California"}, "salinas-california"=>{:city=>"Salinas", :state=>"California"}, "springfield-massachusetts"=>{:city=>"Springfield", :state=>"Massachusetts"}, "pasadena-texas"=>{:city=>"Pasadena", :state=>"Texas"}, "fort-collins-colorado"=>{:city=>"Fort Collins", :state=>"Colorado"}, "hayward-california"=>{:city=>"Hayward", :state=>"California"}, "pomona-california"=>{:city=>"Pomona", :state=>"California"}, "cary-north-carolina"=>{:city=>"Cary", :state=>"North Carolina"}, "rockford-illinois"=>{:city=>"Rockford", :state=>"Illinois"}, "alexandria-virginia"=>{:city=>"Alexandria", :state=>"Virginia"}, "escondido-california"=>{:city=>"Escondido", :state=>"California"}, "mckinney-texas"=>{:city=>"McKinney", :state=>"Texas"}, "kansas-city-kansas"=>{:city=>"Kansas City", :state=>"Kansas"}, "joliet-illinois"=>{:city=>"Joliet", :state=>"Illinois"}, "sunnyvale-california"=>{:city=>"Sunnyvale", :state=>"California"}, "torrance-california"=>{:city=>"Torrance", :state=>"California"}, "bridgeport-connecticut"=>{:city=>"Bridgeport", :state=>"Connecticut"}, "lakewood-colorado"=>{:city=>"Lakewood", :state=>"Colorado"}, "hollywood-florida"=>{:city=>"Hollywood", :state=>"Florida"}, "paterson-new-jersey"=>{:city=>"Paterson", :state=>"New Jersey"}, "naperville-illinois"=>{:city=>"Naperville", :state=>"Illinois"}, "syracuse-new-york"=>{:city=>"Syracuse", :state=>"New York"}, "mesquite-texas"=>{:city=>"Mesquite", :state=>"Texas"}, "dayton-ohio"=>{:city=>"Dayton", :state=>"Ohio"}, "savannah-georgia"=>{:city=>"Savannah", :state=>"Georgia"}, "clarksville-tennessee"=>{:city=>"Clarksville", :state=>"Tennessee"}, "orange-california"=>{:city=>"Orange", :state=>"California"}, "pasadena-california"=>{:city=>"Pasadena", :state=>"California"}, "fullerton-california"=>{:city=>"Fullerton", :state=>"California"}, "killeen-texas"=>{:city=>"Killeen", :state=>"Texas"}, "frisco-texas"=>{:city=>"Frisco", :state=>"Texas"}, "hampton-virginia"=>{:city=>"Hampton", :state=>"Virginia"}, "mcallen-texas"=>{:city=>"McAllen", :state=>"Texas"}, "warren-michigan"=>{:city=>"Warren", :state=>"Michigan"}, "bellevue-washington"=>{:city=>"Bellevue", :state=>"Washington"}, "west-valley-city-utah"=>{:city=>"West Valley City", :state=>"Utah"}, "columbia-south-carolina"=>{:city=>"Columbia", :state=>"South Carolina"}, "olathe-kansas"=>{:city=>"Olathe", :state=>"Kansas"}, "sterling-heights-michigan"=>{:city=>"Sterling Heights", :state=>"Michigan"}, "new-haven-connecticut"=>{:city=>"New Haven", :state=>"Connecticut"}, "miramar-florida"=>{:city=>"Miramar", :state=>"Florida"}, "waco-texas"=>{:city=>"Waco", :state=>"Texas"}, "thousand-oaks-california"=>{:city=>"Thousand Oaks", :state=>"California"}, "cedar-rapids-iowa"=>{:city=>"Cedar Rapids", :state=>"Iowa"}, "charleston-south-carolina"=>{:city=>"Charleston", :state=>"South Carolina"}}

  STATE_ABBREVIATIONS = {
        'Alabama' => 'AL',
        'Alaska' => 'AK',
        'America Samoa' => 'AS',
        'Arizona' => 'AZ',
        'Arkansas' => 'AR',
        'California' => 'CA',
        'Colorado' => 'CO',
        'Connecticut' => 'CT',
        'Delaware' => 'DE',
        'District of Columbia' => 'DC',
        'Federated States of Micronesia' => 'FM',
        'Florida' => 'FL',
        'Georgia' => 'GA',
        'Guam' => 'GU',
        'Hawaii' => 'HI',
        'Idaho' => 'ID',
        'Illinois' => 'IL',
        'Indiana' => 'IN',
        'Iowa' => 'IA',
        'Kansas' => 'KS',
        'Kentucky' => 'KY',
        'Louisiana' => 'LA',
        'Maine' => 'ME',
        'Maryland' => 'MD',
        'Massachusetts' => 'MA',
        'Marshall Islands' => 'MH',
        'Michigan' => 'MI',
        'Minnesota' => 'MN',
        'Mississippi' => 'MS',
        'Missouri' => 'MO',
        'Montana' => 'MT',
        'Nebraska' => 'NE',
        'Nevada' => 'NV',
        'New Hampshire' => 'NH',
        'New Jersey' => 'NJ',
        'New Mexico' => 'NM',
        'New York' => 'NY',
        'North Carolina' => 'NC',
        'North Dakota' => 'ND',
        'Northern Mariana Islands' => 'MP',
        'Ohio' => 'OH',
        'Oklahoma' => 'OK',
        'Oregon' => 'OR',
        'Palau' => 'PW',
        'Pennsylvania' => 'PA',
        'Puerto Rico' => 'PR',
        'Rhode Island' => 'RI',
        'South Carolina' => 'SC',
        'South Dakota' => 'SD',
        'Tennessee' => 'TN',
        'Texas' => 'TX',
        'Utah' => 'UT',
        'Vermont' => 'VT',
        'Virgin Island' => 'VI',
        'Virginia' => 'VA',
        'Washington' => 'WA',
        'West Virginia' => 'WV',
        'Wisconsin' => 'WI',
        'Wyoming' => 'WY'
      }

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
      name: "Nights-and-Weekends",
      start_date: next_cohort_info_east[:start_date],
      early_bird_deadline: next_cohort_info_east[:early_bird_deadline]
    }
    online_cohort_start_dates_west = online_cohort_start_dates.select { |val| val[:location] == "west" }
    next_cohort_info_west = enrolling_cohort_info(online_cohort_start_dates_west)
    @cohorts << {
      name: "Daytime",
      start_date: next_cohort_info_west[:start_date],
      early_bird_deadline: next_cohort_info_west[:early_bird_deadline]
    }
    @cohorts = @cohorts.sort_by { |cohort| cohort[:start_date] }
    render layout: 'main'
  end

  def communities_index
    @cities = []
    CITIES.each do |key, value|
      @cities << [value[:city], value[:state], key]
    end
    @cities.sort!
    render layout: 'main'
  end

  def communities
    city_info = CITIES["#{params[:location]}"]
    @city = city_info[:city]
    @state = city_info[:state]
    @state_abbr = STATE_ABBREVIATIONS[city_info[:state]]
    @tuition_actualize = 9500
    @meetups = Unirest.get("https://api.meetup.com/find/groups?key=#{ENV['MEETUP_API_KEY']}&topic_id=15582&location=#{@city}&order=members").body[0..4]
    render layout: 'main'
  end

  def thank_you
    render layout: 'main'
  end

  def webinar_thank_you
    render layout: 'main'
  end

  def codecademy
    render layout: 'main'
  end

  def tour_thank_you

  end

  def contacts_thank_you
    render layout: 'main'
  end

  def privacy_policy

  end

  def repl
    render layout: 'main'
  end

  def resources
    render layout: 'main'
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
