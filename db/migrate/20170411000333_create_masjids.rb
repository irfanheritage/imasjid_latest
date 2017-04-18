class CreateMasjids < ActiveRecord::Migration[5.0]
  def change
    create_table :masjids do |t|
      t.string      :name,            null: false
      t.text        :description
      t.string      :slug,            null: false
      t.datetime    :established_at
      t.references  :address,         null: false
      t.string      :email
      t.string      :website
      t.string      :linkedin
      t.string      :facebook
      t.string      :twitter
      t.string      :google_plus

      t.timestamps
      t.datetime    :deleted_at
    end

    ## Foreign Keys
    add_foreign_key :masjids, :addresses

    ## Indexes
    add_index :masjids, :name
    add_index :masjids, :slug
  end
end
