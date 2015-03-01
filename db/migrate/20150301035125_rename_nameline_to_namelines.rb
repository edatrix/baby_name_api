class RenameNamelineToNamelines < ActiveRecord::Migration
  def change
    rename_table :nameline, :namelines
  end
end
