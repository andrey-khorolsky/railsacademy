class DeleteOldNoticeJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    Notice.delete(Notice.where("created_at < ?", Time.now-86400))
  end
end
