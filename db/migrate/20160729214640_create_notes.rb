class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.string  :title
      t.text    :body
      t.string  :create_by
      t.boolean :note_type
      t.belongs_to :meeting, index: true

      t.timestamps
    end
  end
end
