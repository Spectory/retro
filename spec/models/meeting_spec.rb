require 'rails_helper'

describe Meeting, type: :model do
  describe 'assosiations' do
    before do
      @subject = FactoryGirl.build(:meeting)
    end

    context 'new meeting' do
      it 'should have no action_items or reviewed_notes' do
        expect(@subject.action_items.count).to be 0
        expect(@subject.notes.count).to be 0
      end
    end

    context 'meeting with note & action_items' do
      before do
        @subject = FactoryGirl.create(:meeting)
        FactoryGirl.create(:action_item, meeting: @subject)
        FactoryGirl.create(:note, meeting: @subject)
      end
      it 'should assign notes and action_items to meeting' do
        expect(@subject.action_items.count).to be 1
        expect(@subject.notes.count).to be 1
      end
    end
  end
end
