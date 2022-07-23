class ChangeColumnToMicroIndustries < ActiveRecord::Migration[6.1]
  def change
    drop_table :micro_industries
  end
end
