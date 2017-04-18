class CreateEventTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :event_types do |t|
      t.string  :code,        null: false
      t.string  :name,        null: false
      t.text    :description

      t.timestamps
    end

    ## Indexes
    add_index :event_types, :code
    add_index :event_types, :name
  end
end
