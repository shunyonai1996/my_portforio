class RemoveColumnFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :job, :string
    remove_column :users, :work_span, :integer
  end
end