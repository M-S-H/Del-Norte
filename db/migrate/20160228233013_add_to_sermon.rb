class AddToSermon < ActiveRecord::Migration
  def change
    add_column :sermons, :name, :string
    add_column :sermons, :image, :string
    add_column :sermons, :description, :text
  end
end
