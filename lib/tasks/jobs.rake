namespace :jobs do
  desc "Exclude old jobs Get new jobs and populate the database"
  task get: :environment do
    Job.delete_all
    GetJobsJob.perform_later
  end
end
