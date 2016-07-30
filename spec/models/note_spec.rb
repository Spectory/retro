require 'rails_helper'

RSpec.describe Note, type: :model do
  it { should respond_to(:title) }
  it { should respond_to(:body) }
  it { should respond_to(:create_by) }
  it { should respond_to(:meeting_id) }
  it { should respond_to(:note_type) }
end
