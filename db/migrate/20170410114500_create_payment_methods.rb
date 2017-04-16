class CreatePaymentMethods < ActiveRecord::Migration[5.0]
  def change
    create_table :payment_methods do |t|
      t.string    :type,                null: false
      t.string    :name,                null: false
      t.text      :description
      t.boolean   :auto_capture,        default: false
      t.boolean   :active,              default: true
      t.integer   :sequence,            default: 0
      t.boolean   :available_to_users,  default: true
      t.boolean   :available_to_admin,  default: true
      t.json      :preferences

      t.timestamps
      t.datetime  :deleted_at
    end
  end
end
