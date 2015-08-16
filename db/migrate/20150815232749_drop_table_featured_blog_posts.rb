class DropTableFeaturedBlogPosts < ActiveRecord::Migration
  def change
    drop_table :featured_blog_posts
  end
end
