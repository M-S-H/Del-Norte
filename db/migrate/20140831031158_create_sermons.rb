class CreateSermons < ActiveRecord::Migration
  def change
    create_table :sermons do |t|

      t.timestamps
    end
  end
end
