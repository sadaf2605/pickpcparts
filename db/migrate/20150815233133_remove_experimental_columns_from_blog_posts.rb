class RemoveExperimentalColumnsFromBlogPosts < ActiveRecord::Migration
  def change
    remove_column :blog_posts, :is_featured, :boolean
    remove_column :blog_posts, :featured_post, :integer
    remove_column :blog_posts, :featured_post_id, :integer
  end
end
