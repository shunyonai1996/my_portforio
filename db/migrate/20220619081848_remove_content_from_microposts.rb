class RemoveContentFromMicroposts < ActiveRecord::Migration[6.1]
  def change
    add_column :microposts, :busyness, :string
    add_column :microposts, :seniority_year, :string
    add_column :microposts, :complement, :text
  end
end