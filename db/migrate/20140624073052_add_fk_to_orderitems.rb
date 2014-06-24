class AddFkToOrderitems < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE order_items
            ADD CONSTRAINT item_order_id_FK
            FOREIGN KEY (order_id)
            REFERENCES orders(order_id)
        SQL
      end
      dir.down do
        execute <<-SQL
          ALTER TABLE order_items
            DROP FOREIGN KEY item_order_id_FK
        SQL
      end
    end
  end
end
