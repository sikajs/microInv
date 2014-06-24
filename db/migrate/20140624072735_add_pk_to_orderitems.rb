class AddPkToOrderitems < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE order_items
            ADD CONSTRAINT order_items_PK
            PRIMARY KEY (order_id, item_id)
        SQL
      end
      dir.down do
        execute <<-SQL
          ALTER TABLE order_items
            DROP CONSTRAINT order_items_PK
        SQL
      end
    end
  end
end
