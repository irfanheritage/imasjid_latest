class CreateEventRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :event_registrations do |t|
      t.references  :event,         null: false
      t.references  :contact,       null: false
      t.datetime    :registered_at
      t.datetime    :unregistered_at
      t.text        :remark

      t.timestamps
    end

    ## Foreign Keys
    add_foreign_key :event_registrations, :events
    add_foreign_key :event_registrations, :contacts
  end
end
