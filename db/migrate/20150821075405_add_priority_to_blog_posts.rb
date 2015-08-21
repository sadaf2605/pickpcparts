class AddPriorityToBlogPosts < ActiveRecord::Migration
  def change
    add_column :blog_posts, :priority, :integer
  end
end
