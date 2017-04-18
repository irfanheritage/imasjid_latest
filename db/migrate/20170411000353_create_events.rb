class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string      :name,            null: false
      t.text        :description
      t.string      :slug,            null: false
      t.references  :masjid
      t.string      :location
      t.string      :location_detail
      t.references  :event_type
      t.references  :category
      t.string      :link
      t.datetime    :start_at
      t.datetime    :end_at
      t.datetime    :available_on
      t.datetime    :reg_start_at
      t.datetime    :reg_end_at

      t.timestamps
      t.datetime    :deleted_at
    end

    ## Foreign Keys
    add_foreign_key :events, :masjids
    add_foreign_key :events, :event_types
    add_foreign_key :events, :categories

    ## Indexes
    add_index :events, :name
    add_index :events, :slug
  end
end
