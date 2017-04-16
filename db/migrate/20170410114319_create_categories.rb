class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.references  :parent,    null: false
      t.integer     :sequence,  default: 0
      t.string      :name,      null: false
      t.string      :permalink, null: false
      t.text        :description
      t.integer     :lft
      t.integer     :rgt
      t.string      :icon_file_name
      t.string      :icon_content_type
      t.integer     :icon_file_size
      t.datetime    :icon_updated_at
      t.string      :meta_title
      t.string      :meta_description
      t.string      :meta_keywords
      t.integer     :depth

      t.timestamps
    end

    ## Foreign Keys
    add_foreign_key :categories, :categories, column: :parent_id, primary_key: :id

    ## Indexes
    add_index :categories, :name
  end
end
