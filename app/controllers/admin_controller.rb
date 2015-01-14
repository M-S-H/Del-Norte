class AdminController < ApplicationController
	before_action :authenticate_admin!
	layout 'dash'

	def dashboard
		
	end

	def koinonia 
		@koinonia = Koinonium.all.reverse
	end
end
