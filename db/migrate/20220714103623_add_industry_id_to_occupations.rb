class AddIndustryIdToOccupations < ActiveRecord::Migration[6.1]
  def change
    add_reference :occupations, :industry, foreign_key: true
  end
end
