class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.text :description
      t.boolean :active
      t.string :name

      t.timestamps
    end
  end
end
