class CreateCountries < ActiveRecord::Migration[5.0]
  def change
    create_table :countries do |t|
      t.string  :iso,       null: false
      t.string  :iso3,      null: false
      t.string  :iso_name,  null: false
      t.string  :name,      null: false
      t.integer :numcode
      t.boolean :states_required

      t.timestamps
    end

    ## Indexes
    add_index :countries, :iso3
    add_index :countries, :name
  end
end
