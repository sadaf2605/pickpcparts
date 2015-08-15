class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.integer :blogit_posts_id
      t.string :avatar
      t.integer :build_id

      t.timestamps null: false
    end
  end
end
