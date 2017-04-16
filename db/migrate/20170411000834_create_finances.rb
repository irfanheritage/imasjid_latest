class CreateFinances < ActiveRecord::Migration[5.0]
  def change
    create_table :finances do |t|
      t.references  :source,            polymorphic: true, null: false
      t.datetime    :transaction_date
      t.string      :transaction_type
      t.text        :description
      t.string      :code
      t.decimal     :amount
      t.decimal     :balance

      t.timestamps
    end
  end
end
