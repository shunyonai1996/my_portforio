class ChangeColumnToOccupation < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :occupations, :industries
    remove_index :occupations, :industry_id
    remove_reference :occupations, :industry
  end
end
