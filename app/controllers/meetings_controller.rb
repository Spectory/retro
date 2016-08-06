class MeetingsController < ApplicationController
  def show
    @meeting = Meeting.last
    @new_notes = Note.all
    @reviewed_notes = Note.where(meeting: @meeting)
    @previous_action_items = []
    @new_action_items = []
    # @meeting = Meeting.new
  end

  def update
    meeting = Meeting.find(params[:id])
    note = Note.find(params[:note])
    meeting.notes << note
    meeting.save!
    redirect_to meeting_path
  end
end
