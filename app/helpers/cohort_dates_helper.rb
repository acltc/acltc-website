module CohortDatesHelper
  NUMBER_OF_DAYS_BEFORE_IN_CLASS_START_DATE_TO_ACCEPT_STUDENTS = 17
  
  def cohort_start_dates
    cohort_dates = [
      { early_bird: Date.new(2017, 12, 31), prework: Date.new(2018, 1, 28), live: Date.new(2018, 2, 25), location: "Chicago Night" },
      { early_bird: Date.new(2017, 12, 31), prework: Date.new(2018, 1, 28), live: Date.new(2018, 2, 25), location: "Online Night" },
      { early_bird: Date.new(2018, 2, 28), prework: Date.new(2018, 4, 1), live: Date.new(2018, 4, 29), location: "Chicago Night" },
      { early_bird: Date.new(2018, 2, 28), prework: Date.new(2018, 4, 8), live: Date.new(2018, 5, 13), location: "Online Night" },
      { early_bird: Date.new(2018, 3, 31), prework: Date.new(2018, 5, 20), live: Date.new(2018, 6, 17), location: "Chicago Night" },
      { early_bird: Date.new(2018, 3, 31), prework: Date.new(2018, 5, 20), live: Date.new(2018, 6, 17), location: "Online Night" },
      { early_bird: Date.new(2018, 5, 31), prework: Date.new(2018, 7, 22), live: Date.new(2018, 8, 19), location: "Chicago Night" },
      { early_bird: Date.new(2018, 5, 31), prework: Date.new(2018, 7, 22), live: Date.new(2018, 8, 19), location: "Online Day" },
      { early_bird: Date.new(2018, 7, 31), prework: Date.new(2018, 9, 2), live: Date.new(2018, 9, 30), location: "Chicago Night" },
      { early_bird: Date.new(2018, 7, 31), prework: Date.new(2018, 9, 2), live: Date.new(2018, 9, 30), location: "Online Night" },
      { early_bird: Date.new(2018, 10, 31), prework: Date.new(2018, 12, 2), live: Date.new(2019, 1, 7), location: "Chicago Day" },
      { early_bird: Date.new(2018, 10, 31), prework: Date.new(2018, 12, 2), live: Date.new(2019, 1, 7), location: "Online Day" },
      { early_bird: Date.new(2018, 11, 30), prework: Date.new(2019, 1, 20), live: Date.new(2019, 2, 17), location: "Chicago Night" },
      { early_bird: Date.new(2018, 11, 30), prework: Date.new(2019, 1, 20), live: Date.new(2019, 2, 17), location: "Online Night" },
      { early_bird: Date.new(2019, 1, 31), prework: Date.new(2019, 3, 24), live: Date.new(2019, 4, 22), location: "Chicago Day" },
      { early_bird: Date.new(2019, 1, 31), prework: Date.new(2019, 3, 24), live: Date.new(2019, 4, 29), location: "Online Day" },
      { early_bird: Date.new(2019, 3, 31), prework: Date.new(2019, 5, 12), live: Date.new(2019, 6, 16), location: "Chicago Night" },
      { early_bird: Date.new(2019, 3, 31), prework: Date.new(2019, 5, 12), live: Date.new(2019, 6, 16), location: "Online Night" },
      { early_bird: Date.new(2019, 5, 31), prework: Date.new(2019, 7, 21), live: Date.new(2019, 8, 19), location: "Chicago Day" },
      { early_bird: Date.new(2019, 5, 31), prework: Date.new(2019, 7, 21), live: Date.new(2019, 8, 19), location: "Online Day" },
      { early_bird: Date.new(2019, 7, 31), prework: Date.new(2019, 9, 22), live: Date.new(2019, 10, 27), location: "Chicago Night" },
      { early_bird: Date.new(2019, 7, 31), prework: Date.new(2019, 9, 22), live: Date.new(2019, 10, 27), location: "Online Night" },
      { early_bird: Date.new(2019, 10, 31), prework: Date.new(2019, 12, 1), live: Date.new(2020, 1, 6), location: "Chicago Day" },
      { early_bird: Date.new(2019, 10, 31), prework: Date.new(2019, 12, 1), live: Date.new(2020, 1, 6), location: "Online Day" },
      { early_bird: Date.new(2019, 11, 30), prework: Date.new(2020, 1, 19), live: Date.new(2020, 2, 23), location: "Chicago Night" },
      { early_bird: Date.new(2019, 11, 30), prework: Date.new(2020, 1, 19), live: Date.new(2020, 2, 23), location: "Online Night" },

      # { early_bird: Date.new(2020, 2, 29), prework: Date.new(2020, 4, 12), live: Date.new(2020, 5, 18), location: "Chicago Day" },
      { early_bird: Date.new(2020, 2, 29), prework: Date.new(2020, 4, 12), live: Date.new(2020, 5, 18), location: "Online Day" },
      { early_bird: Date.new(2020, 3, 31), prework: Date.new(2020, 5, 17), live: Date.new(2020, 6, 21), location: "Chicago Night" },
      { early_bird: Date.new(2020, 3, 31), prework: Date.new(2020, 5, 17), live: Date.new(2020, 6, 21), location: "Online Night" },
      # { early_bird: Date.new(2020, 5, 31), prework: Date.new(2020, 7, 26), live: Date.new(2020, 8, 31), location: "Chicago Day" },
      { early_bird: Date.new(2020, 5, 31), prework: Date.new(2020, 7, 26), live: Date.new(2020, 8, 31), location: "Online Day" },
      { early_bird: Date.new(2020, 5, 31), prework: Date.new(2020, 7, 19), live: Date.new(2020, 8, 23), location: "Chicago Night" },
      { early_bird: Date.new(2020, 5, 31), prework: Date.new(2020, 7, 19), live: Date.new(2020, 8, 23), location: "Online Night" },
      # { early_bird: Date.new(2020, 7, 31), prework: Date.new(2020, 9, 20), live: Date.new(2020, 10, 25), location: "Chicago Night" },
      { early_bird: Date.new(2020, 7, 31), prework: Date.new(2020, 9, 20), live: Date.new(2020, 10, 25), location: "Online Night" },
      # { early_bird: Date.new(2020, 10, 31), prework: Date.new(2020, 11, 29), live: Date.new(2021, 1, 4), location: "Chicago Day" },
      { early_bird: Date.new(2020, 10, 31), prework: Date.new(2020, 11, 29), live: Date.new(2021, 1, 4), location: "Online Day" },
      { early_bird: Date.new(2020, 10, 31), prework: Date.new(2020, 11, 29), live: Date.new(2021, 1, 3), location: "Chicago Night" },
      # { early_bird: Date.new(2020, 11, 30), prework: Date.new(2021, 1, 10), live: Date.new(2021, 2, 14), location: "Chicago Night" },
      { early_bird: Date.new(2020, 11, 30), prework: Date.new(2021, 1, 10), live: Date.new(2021, 2, 14), location: "Online Night" },
      { early_bird: Date.new(2020, 8, 9), prework: Date.new(2020, 9, 13), live: Date.new(2020, 10, 19), location: "Online Day" },
      { early_bird: Date.new(2020, 8, 9), prework: Date.new(2020, 9, 13), live: Date.new(2020, 10, 19), location: "Chicago Day" },
    ].sort_by { |cohort_date| cohort_date[:prework] }
  end

  def upcoming_chicago_cohorts(cohorts, num_cohorts)
    valid_cohorts(cohorts)
      .select { |cohort| cohort[:location].starts_with?("Chicago") }
      .first(num_cohorts)
  end

  def upcoming_online_cohorts(cohorts, num_cohorts)
    valid_cohorts(cohorts)
      .select { |cohort| cohort[:location].start_with? "Online" }
      .first(num_cohorts)
  end

  def valid_cohorts(cohorts)
    result = []
    cohorts.each do |cohort|
      result << cohort if Time.zone.now <= cohort[:live] - NUMBER_OF_DAYS_BEFORE_IN_CLASS_START_DATE_TO_ACCEPT_STUDENTS
    end
    result
  end

  def valid_early_bird_deadline(cohorts)
    return nil if cohorts.length < 1
    upcoming_early_bird = cohorts[0][:early_bird]
    if Time.zone.now <= upcoming_early_bird
      upcoming_early_bird
    else
      nil
    end
  end
end