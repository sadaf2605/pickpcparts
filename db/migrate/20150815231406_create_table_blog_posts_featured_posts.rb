class CreateTableBlogPostsFeaturedPosts < ActiveRecord::Migration
  def change
    create_table :table_blog_posts_featured_posts, id: false do |t|
      t.integer :blog_post_id
      t.integer :featured_post_id
    end
  end
end
