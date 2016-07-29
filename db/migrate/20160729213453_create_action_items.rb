class CreateActionItems < ActiveRecord::Migration[5.0]
  def change
    create_table :action_items do |t|
      t.string  :title
      t.text    :body
      t.string  :assigned_to
      t.timestamps
    end
  end
end
