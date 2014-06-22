class ChangeDefaultForAdjustHistory < ActiveRecord::Migration
  def change
    remove_column :adjust_history, :adjust_time 
    add_timestamps :adjust_history
  end
end
