class RemoveBlogPostIdFromFeaturedBlogPosts < ActiveRecord::Migration
  def change
    remove_column :featured_blog_posts, :blog_post_id, :integer
  end
end
