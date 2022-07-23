class ChangeColumnToOccupations < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :occupations, :micro_industries
    remove_index :occupations, :micro_industry_id
    remove_reference :occupations, :micro_industry
  end
end