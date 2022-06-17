class AddContentToMicroposts < ActiveRecord::Migration[6.1]
  def change
    add_column :microposts, :content_2, :text
    add_column :microposts, :content_3, :text
    add_column :microposts, :content_4, :text
    add_column :microposts, :content_5, :text
    add_column :microposts, :content_6, :text
    add_column :microposts, :content_7, :text
    add_column :microposts, :content_8, :text
    add_column :microposts, :content_9, :text
    add_column :microposts, :content_10, :text
  end
end
