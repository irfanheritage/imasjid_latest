class CreateMasjidMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :masjid_members do |t|
      t.references  :masjid,  null: false
      t.string      :type,    null: false
      t.references  :member,  polymorphic: true
      t.json        :preferences

      t.timestamps
    end

    ## Foreign Keys
    add_foreign_key :masjid_members, :masjids
  end
end
