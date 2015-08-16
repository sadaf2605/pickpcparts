class DropTableBlogPostsFeaturedPosts < ActiveRecord::Migration
  def change
    drop_table :table_blog_posts_featured_posts
  end
end
