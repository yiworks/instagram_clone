class AddDefaultToPosts < ActiveRecord::Migration[5.1]
  def change
    change_column_default :posts, :likes_count, 0
  end
end
