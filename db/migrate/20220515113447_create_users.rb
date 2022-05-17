class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.date :birthday
      t.string :job
      t.integer :work_span

      t.timestamps
    end
  end
end
