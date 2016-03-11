class AddRatingToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :rating_id, :integer
    add_foreign_key :topics, :ratings
    add_index :topics, :rating_id
  end
end
