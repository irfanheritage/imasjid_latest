class CreateAssets < ActiveRecord::Migration[5.0]
  def change
    create_table :assets do |t|
      t.references  :viewable,            polymorphic: true, null: false
      t.integer     :attachment_width
      t.integer     :attachment_height
      t.integer     :attachment_file_size
      t.string      :attachment_content_type
      t.string      :attachment_file_name
      t.datetime    :attachment_updated_at
      t.string      :type
      t.string      :position
      t.integer     :sequence
      t.text        :alt

      t.timestamps
    end
  end
end
