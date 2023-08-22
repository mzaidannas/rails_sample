class JobsCountOverTime < Avo::Dashboards::ChartkickCard
  self.id = "job_count_over_time"
  self.label = "Job count over time"
  self.chart_type = :area_chart
  # self.description = "Some tiny description"
  self.cols = 2
  # self.initial_range = 30
  # self.ranges = {
  #   "7 days": 7,
  #   "30 days": 30,
  #   "60 days": 60,
  #   "365 days": 365,
  #   Today: "TODAY",
  #   "Month to date": "MTD",
  #   "Quarter to date": "QTD",
  #   "Year to date": "YTD",
  #   All: "ALL",
  # }
  # self.chart_options = { library: { plugins: { legend: { display: true } } } }
  # self.flush = true

  def query
    result [
      { name: "Hourly", data: JobRun.where(created_at: 16.hours.ago.beginning_of_hour..).group("date_trunc('hour', created_at)").count },
      { name: "Daily", data: JobRun.where(created_at: 16.days.ago.beginning_of_day..).group("date_trunc('day', created_at)").count },
      { name: "Monthly", data: JobRun.where(created_at: 16.months.ago.beginning_of_month..).group("date_trunc('month', created_at)").count }
    ]
  end
end
