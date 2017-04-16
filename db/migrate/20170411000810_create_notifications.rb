class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.references  :notifiable,    polymorphic: true, null: false
      t.references  :masjid_member, null: false
      t.string      :state,         null: false
      t.datetime    :sent_at

      t.timestamps
    end

    ## Foreign Keys
    add_foreign_key :notifications, :masjid_members
  end
end
