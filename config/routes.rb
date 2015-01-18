Rails.application.routes.draw do
	root 'application#index'

	devise_for :admins, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}

	resources :sermons
	get '/change_sermon' => 'sermons#change_sermon'

	get '/calendar' => 'application#calendar'

	get '/dashboard' => 'admin#dashboard'
	get '/dashboard/koinonia' => 'admin#koinonia'
	get '/dashboard/alert' => 'admin#alert'
	post '/dashboard/update_alert' => 'admin#update_alert'

	resources :koinonia, except: [:show]
	get '/koinonia/download/:id' => 'koinonia#download'

	get '/ministries' => 'ministries#index'

	get '/download_jan' => 'application#download_jan'
	get '/download_feb' => 'application#download_feb'
end
