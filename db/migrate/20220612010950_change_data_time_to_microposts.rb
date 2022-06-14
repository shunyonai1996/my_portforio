class ChangeDataTimeToMicroposts < ActiveRecord::Migration[6.1]
  def change
    change_column :microposts, :time, :string
  end
end
