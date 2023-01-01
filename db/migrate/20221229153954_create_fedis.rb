class CreateFedis < ActiveRecord::Migration[7.0]
  def change
    create_table :fedis do |t|

      t.timestamps
    end
  end
end
