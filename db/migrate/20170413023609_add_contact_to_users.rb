class AddContactToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :contact, foreign_key: true
  end
end
