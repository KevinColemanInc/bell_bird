class DefaultCounterToZero < ActiveRecord::Migration[5.2]
  def change
    Alarm.delete_all
    change_column :alarms, :vote_counter, :integer, default: 0, null: false
  end
end
