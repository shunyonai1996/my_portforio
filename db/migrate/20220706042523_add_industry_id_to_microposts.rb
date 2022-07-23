class AddIndustryIdToMicroposts < ActiveRecord::Migration[6.1]
  def change
    add_reference :microposts, :industry, foreign_key: true
    add_reference :microposts, :micro_industry, foreign_key: true
  end
end
