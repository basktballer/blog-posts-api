class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.string :author
      t.integer :authorId
      t.integer :likes
      t.float :popularity
      t.integer :reads
      t.string :tags, array: true, default: []

      t.timestamps null: false
    end
  end
end
