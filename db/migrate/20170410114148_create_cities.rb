class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.string      :name,    null: false
      t.string      :abbr,    null: false
      t.references  :state,   null: false
      t.string      :code
      t.boolean     :districts_required

      t.timestamps
    end

    ## Foreign Keys
    add_foreign_key :cities, :states

    ## Indexes
    add_index :cities, :name
  end
end
