class AddBuildPostIdToPostOfTheWeeks < ActiveRecord::Migration
  def change
    add_column :post_of_the_weeks, :build_post_id, :integer
    remove_column :post_of_the_weeks, :blogit_post_id, :integer
  end
end
