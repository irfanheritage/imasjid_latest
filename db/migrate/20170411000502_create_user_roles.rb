class CreateUserRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :user_roles do |t|
      t.references  :user,    null: false
      t.references  :role,    null: false
      t.references  :masjid

      t.timestamps
    end

    ## Foreign Keys
    add_foreign_key :user_roles, :users
    add_foreign_key :user_roles, :roles
    add_foreign_key :user_roles, :masjids
  end
end
