module CohortDatesHelper
  def cohort_start_dates
    cohort_dates = [
      # { prework: true, date: Date.new(2017, 1, 22), early_bird_date: nil },
      # { prework: false, date: Date.new(2017, 2, 26), early_bird_date: nil },
      # { prework: true, date: Date.new(2017, 3, 26), early_bird_date: nil },
      # { prework: false, date: Date.new(2017, 4, 23), early_bird_date: nil },
      # { prework: true, date: Date.new(2017, 5, 28), early_bird_date: nil },
      # { prework: false, date: Date.new(2017, 6, 25), early_bird_date: nil },
      # { prework: true, date: Date.new(2017, 7, 23), early_bird_date: nil },
      # { prework: false, date: Date.new(2017, 8, 20), early_bird_date: nil },
      # { prework: true, date: Date.new(2017, 10, 1), early_bird_date: nil },
      # { prework: false, date: Date.new(2017, 11, 5), early_bird_date: nil },
      # { prework: true, date: Date.new(2017, 12, 3), early_bird_date: Date.new(2017, 10, 31) },
      # { prework: false, date: Date.new(2017, 1, 7), early_bird_date: nil },
      { prework: true, date: Date.new(2018, 1, 28), early_bird_date: Date.new(2017, 12, 31) },
      { prework: false, date: Date.new(2018, 2, 25), early_bird_date: nil },
      { prework: true, date: Date.new(2018, 4, 1), early_bird_date: Date.new(2018, 2, 28) },
      { prework: false, date: Date.new(2018, 4, 29), early_bird_date: nil },
      { prework: true, date: Date.new(2018, 5, 20), early_bird_date: Date.new(2018, 3, 31) },
      { prework: false, date: Date.new(2018, 6, 17), early_bird_date: nil },
      { prework: true, date: Date.new(2018, 7, 22), early_bird_date: Date.new(2018, 5, 31) },
      { prework: false, date: Date.new(2018, 8, 19), early_bird_date: nil },
      { prework: true, date: Date.new(2018, 9, 2), early_bird_date: Date.new(2018, 7, 31) },
      { prework: false, date: Date.new(2018, 9, 30), early_bird_date: nil }
    ].sort_by { |cohort_date| cohort_date[:date] }
  end

  def online_cohort_start_dates
    cohort_dates = [
      # { prework: true, date: Date.new(2017, 6, 25), location: "east", early_bird_date: nil },
      # { prework: false, date: Date.new(2017, 7, 23), location: "east", early_bird_date: nil },
      # { prework: true, date: Date.new(2017, 7, 23), location: "west", early_bird_date: nil },
      # { prework: false, date: Date.new(2017, 8, 20), location: "west", early_bird_date: nil },
      # { prework: true, date: Date.new(2017, 10, 22), location: "east", early_bird_date: nil },
      # { prework: false, date: Date.new(2017, 11, 19), location: "east", early_bird_date: nil },
      # { prework: true, date: Date.new(2017, 12, 3), location: "west", early_bird_date: Date.new(2017, 10, 31) },
      # { prework: false, date: Date.new(2018, 1, 7), location: "west", early_bird_date: nil },
      { prework: true, date: Date.new(2018, 1, 28), location: "east", early_bird_date: Date.new(2017, 12, 31) },
      { prework: false, date: Date.new(2018, 2, 25), location: "east", early_bird_date: nil },
      { prework: true, date: Date.new(2018, 4, 8), location: "west", early_bird_date: Date.new(2018, 2, 28) },
      { prework: false, date: Date.new(2018, 5, 13), location: "west", early_bird_date: nil },
      { prework: true, date: Date.new(2018, 5, 20), location: "east", early_bird_date: Date.new(2018, 3, 31) },
      { prework: false, date: Date.new(2018, 6, 17), location: "east", early_bird_date: nil },
      { prework: true, date: Date.new(2018, 7, 22), location: "west", early_bird_date: Date.new(2018, 5, 31) },
      { prework: false, date: Date.new(2018, 8, 19), location: "west", early_bird_date: nil },
      { prework: true, date: Date.new(2018, 9, 2), location: "east", early_bird_date: Date.new(2018, 7, 31) },
      { prework: false, date: Date.new(2018, 9, 30), location: "east", early_bird_date: nil },
      { prework: true, date: Date.new(2018, 11, 18), location: "west", early_bird_date: Date.new(2018, 9, 30) },
      { prework: false, date: Date.new(2018, 12, 16), location: "west", early_bird_date: nil },
    ].sort_by { |cohort_date| cohort_date[:date] }
  end
end
