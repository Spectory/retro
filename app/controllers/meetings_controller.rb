class MeetingsController < ApplicationController
  before_action :set_selected

  def create
    mid = Meeting.create!
    redirect_to meeting_path(mid)
  end

  def show
    if params[:id]
      load_by_id(params[:id].to_i)
    else
      load_recent
    end
    case @selected
    when 'discussion'
      @new_notes = Note.where(meeting: nil)
      @reviewed_notes = Note.where(meeting: @meeting)
    when 'previous_action_items'
      @previous_action_items = ActionItem.where(meeting: @previouse_meeting)
    when 'new_action_items'
      @new_action_items = ActionItem.where(meeting: @meeting)
    end
  end

  def update
    meeting = Meeting.find(params[:id])
    note = Note.find(params[:note])
    meeting.notes << note
    meeting.save!
    redirect_to meeting_path
  end

  private

  def load_by_id(meeting_id)
    previouse_meeting_id = meeting_id - 1
    next_meeting_id = meeting_id + 1
    ids = [previouse_meeting_id, meeting_id, next_meeting_id]
    meetings = Meeting.where(id: ids).order(:id)
    @meeting = meetings.where(id: meeting_id).first
    @next_meeting = meetings.where(id: next_meeting_id).first
    @previouse_meeting = meetings.where(id: previouse_meeting_id).first
  end

  def load_recent
    last_meetings = Meeting.all.order(created_at: :desc).take(2)
    @next_meeting = nil
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
  end

  def set_selected
    @selected = params[:selected] || 'discussion'
  end
end
