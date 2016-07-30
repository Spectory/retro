class Meeting < ApplicationRecord
  has_many :action_items
  has_many :notes
end
