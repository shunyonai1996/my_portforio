class CreateJobDiscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :job_discriptions do |t|
      t.text :content
      t.time :time
      t.references :micropost, foreign_key: true

      t.timestamps
    end
  end
end
