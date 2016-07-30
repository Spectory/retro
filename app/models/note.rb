class Note < ApplicationRecord
  belongs_to :meeting

  enum note_type: { positive: 0, negative: 1 }

  validates :title, presence: true
  validates :body, presence: true
  validates :note_type, presence: true

end
