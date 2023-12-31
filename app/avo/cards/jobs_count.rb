class JobsCount < Avo::Dashboards::MetricCard
  self.id = "jobs_count"
  self.label = "Jobs Count"
  self.description = "Jobs count for range"
  # self.cols = 1
  self.initial_range = 30
  self.ranges = {
    '7 days': 7,
    '30 days': 30,
    '60 days': 60,
    '365 days': 365,
    Today: "TODAY",
    'Month to date': "MTD",
    'Quarter to date': "QTD",
    'Year to date': "YTD",
    All: "ALL"
  }
  # self.prefix = ""
  # self.suffix = ""

  def query
    from = Time.zone.today.midnight - 1.week
    to = Time.current

    if range.present?
      if range.to_s == range.to_i.to_s
        from = Time.current - range.to_i.days
      else
        case range
        when "TODAY"
          from = Time.current.beginning_of_day
        when "MTD"
          from = Time.current.beginning_of_month
        when "QTD"
          from = Time.current.beginning_of_quarter
        when "YTD"
          from = Time.current.beginning_of_year
        when "ALL"
          from = Time.zone.at(0)
        end
      end
    end

    result JobRun.where(created_at: from..to).count
  end
end
