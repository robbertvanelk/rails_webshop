class AddCountToProduct < ActiveRecord::Migration
  def change
    add_column :products, :count, :integer
  end
end
