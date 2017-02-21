namespace :mailer do
  desc 'sends email with today meeting summary'
  task send_meeting_summary_email: :environment do
    ActiveRecord::Base.transaction do
      meetings = Meeting.where("created_at >= ?", Time.zone.now.beginning_of_day)
      meetings.each do |m|
        MeetingMailer.meeting_summary(Meeting.last, ENV["send_summary_email_to"]).deliver_now
      end
    end
  end
end