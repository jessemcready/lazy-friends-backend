class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :group_id
      t.datetime :date
      t.string :name

      t.timestamps
    end
  end
end
