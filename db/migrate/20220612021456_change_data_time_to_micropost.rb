class ChangeDataTimeToMicropost < ActiveRecord::Migration[6.1]
  def change
    change_column :microposts, :time, :time
  end
end
