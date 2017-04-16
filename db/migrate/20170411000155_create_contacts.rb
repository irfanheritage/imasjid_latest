class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string    :name,  null: false
      t.string    :gender
      t.datetime  :birth_date
      t.string    :id_card
      t.string    :id_card_number
      t.string    :email
      t.string    :website
      t.string    :linkedin
      t.string    :facebook
      t.string    :twitter
      t.string    :google_plus

      t.timestamps
      t.datetime  :deleted_at
    end

    ## Indexes
    add_index :contacts, :name
  end
end
