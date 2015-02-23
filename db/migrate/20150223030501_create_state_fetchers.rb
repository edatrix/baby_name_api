class CreateStateFetchers < ActiveRecord::Migration
  def change
    create_table :state_fetchers do |t|

      t.timestamps
    end
  end
end
