class CreateDistricts < ActiveRecord::Migration[5.0]
  def change
    create_table :districts do |t|
      t.string      :name,    null: false
      t.string      :abbr,    null: false
      t.references  :city,   null: false
      t.string      :code

      t.timestamps
    end

    ## Foreign Keys
    add_foreign_key :districts, :cities

    ## Indexes
    add_index :districts, :name
  end
end
