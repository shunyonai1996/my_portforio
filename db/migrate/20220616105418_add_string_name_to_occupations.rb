class AddStringNameToOccupations < ActiveRecord::Migration[6.1]
  def change
    create_table :occupations do |t|
      t.string :name
      t.references :micropost, foreign_key: true
    end
  end
end
