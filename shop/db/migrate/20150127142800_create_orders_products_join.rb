class CreateOrdersProductsJoin < ActiveRecord::Migration
  def change
    create_table :orders_products do |t|
    	t.column 'order_id', :integer
    	t.column 'product_id', :integer
    end
  end
end
