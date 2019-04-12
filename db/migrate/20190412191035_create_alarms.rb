class CreateAlarms < ActiveRecord::Migration[5.2]
  def change
    create_table :alarms do |t|
      t.string :description
      t.integer :vote_counter

      t.timestamps
    end
  end
end
