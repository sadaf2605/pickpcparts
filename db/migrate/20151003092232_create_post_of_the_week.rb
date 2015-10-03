class CreatePostOfTheWeek < ActiveRecord::Migration
  def change
    create_table :post_of_the_weeks do |t|
      t.string :blogit_post_id
      t.date :date
      t.string :avatar
    end
  end
end
