class AddColumnsToState < ActiveRecord::Migration
  def change
    add_column :states, :state, :string
    add_column :states, :sex, :string
    add_column :states, :year, :integer
    add_column :states, :name, :string
    add_column :states, :count, :integer
  end
end