class ChangeCroTableToCros < ActiveRecord::Migration
  def change
    rename_table "cro", "cros"
  end
end
