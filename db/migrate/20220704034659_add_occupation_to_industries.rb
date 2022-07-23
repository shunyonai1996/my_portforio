class AddOccupationToIndustries < ActiveRecord::Migration[6.1]
  def change
    add_reference :occupations, :industry, null: false, foreign_key: true
  end
end
