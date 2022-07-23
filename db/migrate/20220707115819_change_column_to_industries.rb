class ChangeColumnToIndustries < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :industries, :microposts
    remove_index :industries, :micropost_id
    remove_reference :industries, :micropost
  end
end
