module CohortDatesHelper
  def cohort_start_dates
    cohort_dates = [
      { prework: true, date: Date.new(2017, 1, 22) },
      { prework: false, date: Date.new(2017, 2, 26) },
      { prework: true, date: Date.new(2017, 3, 26) },
      { prework: false, date: Date.new(2017, 4, 23) },
      { prework: true, date: Date.new(2017, 5, 28) },
      { prework: false, date: Date.new(2017, 6, 25) },
      { prework: true, date: Date.new(2017, 7, 23) },
      { prework: false, date: Date.new(2017, 8, 20) },
      { prework: true, date: Date.new(2017, 9, 17) },
      { prework: false, date: Date.new(2017, 10, 15) },
      { prework: true, date: Date.new(2017, 11, 19) },
      { prework: false, date: Date.new(2017, 12, 17) }
    ].sort_by { |cohort_date| cohort_date[:date] }
  end
end
