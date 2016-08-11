class MeetingsController < ApplicationController
  def create
    mid = Meeting.create!
    redirect_to meeting_path(mid)
  end

  def show
    last_meetings = Meeting.all.order(created_at: :desc).take(2)
    case last_meetings.count
    when 0
      @meeting = Meeting.create!
      @previouse_meeting = nil
    when 1
      @meeting = last_meetings.first
      @previouse_meeting = nil
    else
      @meeting = last_meetings.first
      @previouse_meeting = last_meetings.second
    end
    @new_notes = Note.where(meeting: nil)
    @reviewed_notes = Note.where(meeting: @meeting)
    @previous_action_items = ActionItem.where(meeting: @previouse_meeting)
    @new_action_items = ActionItem.where(meeting: @meeting)
  end

  def update
    meeting = Meeting.find(params[:id])
    note = Note.find(params[:note])
    meeting.notes << note
    meeting.save!
    redirect_to meeting_path
  end
end
