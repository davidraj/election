Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  post 'election', to: 'elections#create'
  post 'candidate', to: 'elections#create_candidate'
  post 'voting', to: 'elections#voting'
  get  'result/:election_id', to: 'elections#result'
end
