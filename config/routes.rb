Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
	  root to: "devise/sessions#new"
	end

	resources :questions, only: [:index, :show]
	resources :follows, only: [] do 
		collection do 
			post 'topic'
			post 'user'
		end
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
