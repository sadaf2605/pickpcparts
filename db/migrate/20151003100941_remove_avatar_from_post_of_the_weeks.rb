class RemoveAvatarFromPostOfTheWeeks < ActiveRecord::Migration
  def change
    remove_column :post_of_the_weeks, :avatar, :string
  end
end
