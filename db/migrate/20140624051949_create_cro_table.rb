class CreateCroTable < ActiveRecord::Migration
  def change
    create_table :cros do |t|
      t.references :customer,	null: false
      t.datetime :return_time,  null: false
      t.decimal :return_total,  null: false
      t.decimal :orig_discount
    end
  end
end
