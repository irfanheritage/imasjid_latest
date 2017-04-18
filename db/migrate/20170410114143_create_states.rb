class CreateStates < ActiveRecord::Migration[5.0]
  def change
    create_table :states do |t|
      t.string      :name,     null: false
      t.string      :abbr,     null: false
      t.references  :country,  null: false
      t.string      :code
      t.boolean     :cities_required

      t.timestamps
    end

    ## Foreign Keys
    add_foreign_key :states, :countries

    ## Indexes
    add_index :states, :name
  end
end
