class CreateInventories < ActiveRecord::Migration[5.0]
  def change
    create_table :inventories do |t|
      t.references  :masjid,          null: false
      t.string      :code
      t.string      :name,            null: false
      t.text        :description
      t.string      :brand
      t.string      :brand_type
      t.string      :unit_currency
      t.decimal     :unit_price
      t.integer     :available_stock

      t.timestamps
    end

    ## Foreign Keys
    add_foreign_key :inventories, :masjids
  end
end
