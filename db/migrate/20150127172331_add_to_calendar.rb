class AddToCalendar < ActiveRecord::Migration
	def change
		add_column :calendars, :name, :string
		add_column :calendars, :pdf, :string
		add_column :calendars, :month, :integer
	end
end
