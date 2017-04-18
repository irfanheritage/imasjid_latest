class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string      :name,      null: false
      t.string      :address1,  null: false
      t.string      :address2
      t.references  :district
      t.references  :city,      null: false
      t.references  :state,     null: false
      t.references  :country,   null: false
      t.string      :zipcode,   null: false
      t.string      :location
      t.string      :phone
      t.string      :mobile

      t.timestamps
      t.datetime    :deleted_at
    end

    ## Foreign Keys
    add_foreign_key :addresses, :districts
    add_foreign_key :addresses, :cities
    add_foreign_key :addresses, :states
    add_foreign_key :addresses, :countries

    ## Indexes
    add_index :addresses, :name
  end
end
