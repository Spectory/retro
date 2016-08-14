class ActionItem < ApplicationRecord
  enum action_type: { keep_doing: 0, stop_doing: 1, start_doing: 2 }

  belongs_to :meeting
  belongs_to :note

  validates :title, presence: true
  validates :body, presence: true
  validates :action_type, presence: true
  validates :assigned_to, presence: true
  validates :meeting_id, presence: true
  validates :note_id, presence: true

end
