class CreateEventCommittees < ActiveRecord::Migration[5.0]
  def change
    create_table :event_committees do |t|
      t.references  :event,         null: false
      t.references  :contact,       null: false
      t.string      :position
      t.text        :description

      t.timestamps
    end

    ## Foreign Keys
    add_foreign_key :event_committees, :events
    add_foreign_key :event_committees, :contacts
  end
end
