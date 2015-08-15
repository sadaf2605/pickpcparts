class AddPostIdToBlogPosts < ActiveRecord::Migration
  def change
    add_column :blog_posts, :post_id, :integer
        add_column :blog_posts, :blogit_post_id, :integer
  end
end
