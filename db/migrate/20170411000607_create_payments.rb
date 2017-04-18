class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.references  :contact,         null: false
      t.references  :payable,         polymorphic: true
      t.references  :source,          polymorphic: true
      t.decimal     :amount,          null: false
      t.references  :payment_method,  null: false
      t.string      :state,           null: false
      t.text        :remark
      t.string      :number
      t.string      :response_code
      t.string      :avs_response_code
      t.string      :cvv_response_code
      t.string      :cvv_response_message

      t.timestamps
    end

    ## Foreign Keys
    add_foreign_key :payments, :contacts
    add_foreign_key :payments, :payment_methods

    ## Indexes
    add_index :payments, :state
  end
end
