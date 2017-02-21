class MeetingMailer < ApplicationMailer

  def meeting_summary(meeting, email)
    Rails.logger.info("sending meeting summary to #{email}")
    @meeting = meeting
    @summary = summary(@meeting.id)
    mail(to: email, subject: 'Retrospective Meeting Summary')
  end

  private

  def summary(meeting_id)
    meeting = Meeting.includes(:notes, :action_items).find_by(id: meeting_id)
    notes = meeting.notes
    action_items = meeting.action_items
    res = []
    action_items.each do |ai|
      note = notes.where(id: ai.note_id).first
      next unless note
      row = {}
      row[:by] = note.create_by
      row[:note_title] = note.title
      row[:note_body] = note.body
      row[:assiged_to] = ai.assigned_to
      row[:action_item_title] = ai.title
      row[:action_item_body] = ai.body
      res.push row
    end
    res
  end
end
