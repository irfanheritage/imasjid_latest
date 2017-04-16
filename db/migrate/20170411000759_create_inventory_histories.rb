class CreateInventoryHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :inventory_histories do |t|
      t.references  :inventory,         null:false
      t.datetime    :transaction_date,  null:false
      t.string      :code
      t.text        :description
      t.string      :type
      t.integer     :quantity

      t.timestamps
    end

    ## Foreign Keys
    add_foreign_key :inventory_histories, :inventories
  end
end
