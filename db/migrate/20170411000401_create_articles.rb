class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string      :slug,        null: false
      t.string      :title,       null: false
      t.text        :content,     null: false
      t.string      :author_name, null: false
      t.references  :source,      polymorphic: true
      t.references  :category
      t.string      :link
      t.datetime    :available_on
      t.integer     :views
      t.datetime    :approved_at

      t.timestamps
      t.datetime    :deleted_at
    end

    ## Foreign Keys
    add_foreign_key :articles, :categories

    ## Indexes
    add_index :articles, :slug
    add_index :articles, :title
    add_index :articles, :author_name
  end
end
