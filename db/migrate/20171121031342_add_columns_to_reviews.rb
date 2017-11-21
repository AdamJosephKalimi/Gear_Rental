class AddColumnsToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :user_content, :text
    add_column :reviews, :gear_content, :text
    remove_column :reviews, :content
  end
end
