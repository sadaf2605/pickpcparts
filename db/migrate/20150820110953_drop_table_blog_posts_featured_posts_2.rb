class DropTableBlogPostsFeaturedPosts2 < ActiveRecord::Migration
  def change
    drop_table :blog_posts_featured_posts
  end
end
