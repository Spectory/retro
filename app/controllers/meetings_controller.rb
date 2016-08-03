class MeetingsController < ApplicationController
  def show
    @new_notes = Note.all
    @reviewed_notes = []
    @previous_action_items = []
    @new_action_items = []
    # @meeting = Meeting.new
  end
end
