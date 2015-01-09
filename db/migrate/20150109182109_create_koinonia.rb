class CreateKoinonia < ActiveRecord::Migration
  def change
    create_table :koinonia do |t|
      t.string :name
      t.string :image_url
      t.string :url

      t.timestamps
    end
  end
end
