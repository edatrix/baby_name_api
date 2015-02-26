class RenameStatetoStateName < ActiveRecord::Migration
  def change
    rename_column :states, :state, :state_name
  end
end
