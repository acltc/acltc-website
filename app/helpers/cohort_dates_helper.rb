module CohortDatesHelper
  def cohort_start_dates
    cohort_dates = [
      { early_bird: Date.new(2017, 12, 31), prework: Date.new(2018, 1, 28), live: Date.new(2018, 2, 25), location: "Chicago" },
      { early_bird: Date.new(2017, 12, 31), prework: Date.new(2018, 1, 28), live: Date.new(2018, 2, 25), location: "Online Night" },
      { early_bird: Date.new(2018, 2, 28), prework: Date.new(2018, 4, 1), live: Date.new(2018, 4, 29), location: "Chicago"  },
      { early_bird: Date.new(2018, 2, 28), prework: Date.new(2018, 4, 8), live: Date.new(2018, 5, 13), location: "Online Night"  },
      { early_bird: Date.new(2018, 3, 31), prework: Date.new(2018, 5, 20), live: Date.new(2018, 6, 17), location: "Chicago" },
      { early_bird: Date.new(2018, 3, 31), prework: Date.new(2018, 5, 20), live: Date.new(2018, 6, 17), location: "Online Night" },
      { early_bird: Date.new(2018, 5, 31), prework: Date.new(2018, 7, 22), live: Date.new(2018, 8, 19), location: "Chicago" },
      { early_bird: Date.new(2018, 5, 31), prework: Date.new(2018, 7, 22), live: Date.new(2018, 8, 19), location: "Online Day" },
      { early_bird: Date.new(2018, 7, 31), prework: Date.new(2018, 9, 2), live: Date.new(2018, 9, 30), location: "Chicago" },
      { early_bird: Date.new(2018, 7, 31), prework: Date.new(2018, 9, 2), live: Date.new(2018, 9, 30), location: "Online Night" },
      { early_bird: Date.new(2018, 10, 31), prework: Date.new(2018, 12, 2), live: Date.new(2019, 1, 6), location: "Chicago" },
      { early_bird: Date.new(2018, 10, 31), prework: Date.new(2018, 12, 2), live: Date.new(2019, 1, 6), location: "Online Day" },
      { early_bird: Date.new(2018, 11, 30), prework: Date.new(2019, 1, 20), live: Date.new(2019, 2, 17), location: "Chicago" },
      { early_bird: Date.new(2018, 11, 30), prework: Date.new(2019, 1, 20), live: Date.new(2019, 2, 17), location: "Online Night" },
      { early_bird: Date.new(2019, 1, 31), prework: Date.new(2019, 3, 24), live: Date.new(2019, 4, 28), location: "Chicago" },
      { early_bird: Date.new(2019, 1, 31), prework: Date.new(2019, 3, 24), live: Date.new(2019, 4, 28), location: "Online Day" },
      { early_bird: Date.new(2019, 3, 31), prework: Date.new(2019, 5, 12), live: Date.new(2019, 6, 16), location: "Chicago" },
      { early_bird: Date.new(2019, 3, 31), prework: Date.new(2019, 5, 12), live: Date.new(2019, 6, 16), location: "Online Night" },
      { early_bird: Date.new(2019, 5, 31), prework: Date.new(2019, 7, 21), live: Date.new(2019, 8, 18), location: "Chicago" },
      { early_bird: Date.new(2019, 5, 31), prework: Date.new(2019, 7, 21), live: Date.new(2019, 8, 18), location: "Online Day" },
      { early_bird: Date.new(2019, 7, 31), prework: Date.new(2019, 9, 22), live: Date.new(2019, 10, 27), location: "Chicago" },
      { early_bird: Date.new(2019, 7, 31), prework: Date.new(2019, 9, 22), live: Date.new(2019, 10, 27), location: "Online Night" },
      { early_bird: Date.new(2019, 10, 31), prework: Date.new(2019, 12, 1), live: Date.new(2020, 1, 5), location: "Chicago" },
      { early_bird: Date.new(2019, 10, 31), prework: Date.new(2019, 12, 1), live: Date.new(2020, 1, 5), location: "Online Day" },
      { early_bird: Date.new(2019, 11, 30), prework: Date.new(2020, 1, 26), live: Date.new(2020, 2, 23), location: "Chicago" },
      { early_bird: Date.new(2019, 11, 30), prework: Date.new(2020, 1, 26), live: Date.new(2020, 2, 23), location: "Online Night" },
    ].sort_by { |cohort_date| cohort_date[:prework] }
  end
end
