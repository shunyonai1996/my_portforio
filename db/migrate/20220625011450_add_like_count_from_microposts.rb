class AddLikeCountFromMicroposts < ActiveRecord::Migration[6.1]
  def change
    add_column :microposts, :likes_count, :integer, default: 0
  end
end
