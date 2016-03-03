class AddDataToSermons < ActiveRecord::Migration
  def change
    add_column :sermons, :sermondate, :string
  end
end
