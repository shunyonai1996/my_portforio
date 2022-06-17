class AddOccupationIdToMicroposts < ActiveRecord::Migration[6.1]
  def change
    add_reference :microposts, :occupation, foreign_key: true
  end

  def down
    remove_column :microposts, :occupation, :string
  end
end
