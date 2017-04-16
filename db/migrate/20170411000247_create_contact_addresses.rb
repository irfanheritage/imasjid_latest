class CreateContactAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :contact_addresses do |t|
      t.references  :contact
      t.references  :address
      t.boolean     :default

      t.timestamps
    end

    ## Foreign Keys
    add_foreign_key :contact_addresses, :addresses
    add_foreign_key :contact_addresses, :contacts
  end
end
