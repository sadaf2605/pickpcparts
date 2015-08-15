class RemoveBlogitPostFromBlogPosts < ActiveRecord::Migration
  def change
    remove_column :blog_posts, :blogit_post, :integer
    remove_column :blog_posts, :post_id, :integer
    remove_column :blog_posts, :blogit_posts_id, :string
  end
end
