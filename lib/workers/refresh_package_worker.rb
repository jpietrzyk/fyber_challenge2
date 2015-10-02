class RefreshPackageWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { daily.hour_of_day(12).minute_of_hour(0) }

  def perform
    Jobs::PackageJob.run
  end
end
