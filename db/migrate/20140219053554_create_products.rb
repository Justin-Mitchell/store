class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.string :company
      t.integer :upc_code
      t.string :website
      t.text :description

      t.timestamps
    end
  end
end
