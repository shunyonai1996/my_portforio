class AddMicropostsToMicroIndustry < ActiveRecord::Migration[6.1]
  def change
    add_reference :micro_industries, :micropost, foreign_key: true
  end
end
