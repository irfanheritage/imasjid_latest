class CreateDonations < ActiveRecord::Migration[5.0]
  def change
    create_table :donations do |t|
      t.string      :name,        null: false
      t.text        :description, null: false
      t.string      :slug,        null: false
      t.references  :donatable,   polymorphic: true
      t.datetime    :start_at
      t.datetime    :end_at
      t.datetime    :available_on
      t.decimal     :target_amount
      t.decimal     :collected_amount

      t.timestamps
      t.datetime    :deleted_at
    end
  end
end
