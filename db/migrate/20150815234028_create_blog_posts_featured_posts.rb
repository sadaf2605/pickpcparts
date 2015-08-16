class CreateBlogPostsFeaturedPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts_featured_posts do |t|
      t.integer :blog_post_id
      t.integer :featured_post_id
    end
  end
end
