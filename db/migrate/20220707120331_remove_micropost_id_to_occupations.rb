class RemoveMicropostIdToOccupations < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :occupations, :microposts
    remove_index :occupations, :micropost_id
    remove_reference :occupations, :micropost
  end
end
