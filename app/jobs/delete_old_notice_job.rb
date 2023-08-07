class DeleteOldNoticeJob < ApplicationJob
  queue_as :default
  @@task = false

  # Enqueue if job not in queue
  around_enqueue do |_job, block|
    unless @@task
      block.call
      @@task = true
    end
  end

  # delete notices older than one week
  def perform(*_args)
    # Do something later
    Notice.delete(Notice.where('created_at < ?', Time.now - 604_800))
    @@task = false
  end
end
