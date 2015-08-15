class AddBlogitPostIdToBlogPosts < ActiveRecord::Migration
  def change
    add_column :blog_posts, :blogit_post, :integer
  end
end
