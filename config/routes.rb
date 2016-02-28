Rails.application.routes.draw do
  resources :calendars

	root 'application#index'

	devise_for :admins, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}

	resources :sermons
	get '/change_sermon' => 'sermons#change_sermon'

	#get '/calendar' => 'application#calendar'
	resources :calendars, except: [:show, :create, :new]
	get '/calendar/:id/download' => 'calendars#download'

	get '/dashboard' => 'admin#dashboard'
	get '/dashboard/koinonia' => 'admin#koinonia'
	get '/dashboard/calendars' => 'admin#calendars'
	get '/dashboard/alert' => 'admin#alert'
	post '/dashboard/update_alert' => 'admin#update_alert'

	resources :koinonia, except: [:show]
	get '/koinonia/download/:id' => 'koinonia#download'

	get '/ministries' => 'ministries#index'
	get '/prayer' => 'ministries#prayer_index'
	post '/prayer_request' => 'ministries#send_request'

	get '/download_jan' => 'application#download_jan'
	get '/download_feb' => 'application#download_feb'

	get '/contact' => 'application#contact'
end
