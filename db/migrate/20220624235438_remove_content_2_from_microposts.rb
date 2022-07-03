class RemoveContent2FromMicroposts < ActiveRecord::Migration[6.1]
  def change
    remove_column :microposts, :content, :text
    remove_column :microposts, :content_2, :text
    remove_column :microposts, :content_3, :text
    remove_column :microposts, :content_4, :text
    remove_column :microposts, :content_5, :text
    remove_column :microposts, :content_6, :text
    remove_column :microposts, :content_7, :text
    remove_column :microposts, :content_8, :text
    remove_column :microposts, :content_9, :text
    remove_column :microposts, :content_10, :text
    remove_column :microposts, :time, :time
    remove_column :microposts, :time_2, :time
    remove_column :microposts, :time_3, :time
    remove_column :microposts, :time_4, :time
    remove_column :microposts, :time_5, :time
    remove_column :microposts, :time_6, :time
    remove_column :microposts, :time_7, :time
    remove_column :microposts, :time_8, :time
    remove_column :microposts, :time_9, :time
    remove_column :microposts, :time_10, :time
  end
end
