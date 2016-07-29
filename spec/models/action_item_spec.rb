require 'rails_helper'

describe ActionItem, type: :model do
  it { should respond_to(:title) }
  it { should respond_to(:body) }
  it { should respond_to(:assigned_to) }
end
