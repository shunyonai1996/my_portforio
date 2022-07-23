class ChangeColumnToMicropost < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :microposts, :micro_industries
    remove_index :microposts, :micro_industry_id
    remove_reference :microposts, :micro_industry
  end
end
