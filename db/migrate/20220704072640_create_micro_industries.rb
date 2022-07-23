class CreateMicroIndustries < ActiveRecord::Migration[6.1]
  def change
    create_table :micro_industries do |t|
      t.string :name, null: false
      t.references :industry, null: false, foreign_key: true

      t.timestamps
    end
  end
end
