class AddTimestampsToSupplier < ActiveRecord::Migration
  def change
    change_table :suppliers do |t|
      t.timestamps
    end
  end
end
