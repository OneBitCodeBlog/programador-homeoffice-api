class GetJobsJob < ApplicationJob
  queue_as :default

  def perform
    SitesUtil.params.each do |params|
      SearchRemoteJobsService.new(params).execute
    end
  end
end
