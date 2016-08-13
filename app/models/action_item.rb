class ActionItem < ApplicationRecord
  enum action_type: { keep_doing: 0, stop_doing: 1, start_doing: 2 }

  belongs_to :meeting

end
