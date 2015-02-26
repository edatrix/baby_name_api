class RenameStatestoNameLine < ActiveRecord::Migration
  def change
    rename_table :states, :nameline
  end
end
