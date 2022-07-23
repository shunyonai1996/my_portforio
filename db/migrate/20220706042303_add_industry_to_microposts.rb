class AddIndustryToMicroposts < ActiveRecord::Migration[6.1]
  def change
    add_reference :industries, :micropost, foreign_key: true
  end
end
