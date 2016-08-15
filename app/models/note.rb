class Note < ApplicationRecord
  belongs_to :meeting, optional: true
  belongs_to :action_item, optional: true

  enum note_type: { positive: 0, negative: 1 }

  validates :title, presence: true
  validates :body, presence: true
  validates :note_type, presence: true
end
