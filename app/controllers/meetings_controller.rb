class MeetingsController < ApplicationController
  def show
    last_meetings = Meeting.all.order(created_at: :desc).take(2)
    @meeting = Meeting.last
    @meeting = last_meetings.first
    @previouse_meeting = last_meetings.second
    @new_notes = Note.where(meeting: nil)
    @reviewed_notes = Note.where(meeting: @meeting)
    @previous_action_items = ActionItem.where(meeting_id: @previouse_meeting.id)
    @new_action_items = ActionItem.where(meeting_id: @meeting.id)
  end

  def update
    meeting = Meeting.find(params[:id])
    note = Note.find(params[:note])
    meeting.notes << note
    meeting.save!
    redirect_to meeting_path
  end
end
