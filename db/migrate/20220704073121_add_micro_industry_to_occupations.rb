class AddMicroIndustryToOccupations < ActiveRecord::Migration[6.1]
  def change
    add_reference :occupations, :micro_industry, null: false, foreign_key: true
  end
end
