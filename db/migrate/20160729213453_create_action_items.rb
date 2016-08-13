class CreateActionItems < ActiveRecord::Migration[5.0]
  def change
    create_table :action_items do |t|
      t.string  :title
      t.integer :action_type
      t.text    :body
      t.string  :assigned_to
      t.belongs_to :meeting
      t.belongs_to :note
      t.belongs_to :action_item
      t.timestamps
    end
  end
end
