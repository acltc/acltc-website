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
      { prework: true, date: Date.new(2017, 10, 1) },
      { prework: false, date: Date.new(2017, 11, 5) },
      { prework: true, date: Date.new(2017, 12, 3) },
      { prework: false, date: Date.new(2018, 1, 7) }
    ].sort_by { |cohort_date| cohort_date[:date] }
  end

  def online_cohort_start_dates
    cohort_dates = [
      { prework: true, date: Date.new(2017, 6, 25) },
      { prework: false, date: Date.new(2017, 7, 23) },
      { prework: true, date: Date.new(2017, 7, 23) },
      { prework: false, date: Date.new(2017, 8, 20) },
      { prework: true, date: Date.new(2017, 10, 22) },
      { prework: false, date: Date.new(2017, 11, 19) },
      { prework: true, date: Date.new(2017, 12, 3) },
      { prework: false, date: Date.new(2018, 1, 7) }
    ].sort_by { |cohort_date| cohort_date[:date] }
  end
end
