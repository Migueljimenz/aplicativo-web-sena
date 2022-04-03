Rails.application.routes.draw do
 
  get 'programas/index'
  devise_for :users
  root to: "dashboard#index"

  # delete "areas/:id" => "areas#destroy"
  # get '/areas/:id/edit', to: 'areas#edit',  as: 'edit_area'
  # put '/areas/:id', to: 'areas#update'

  # delete "areas/:area_id/programas/:id" => "areas/programas#destroy"
  # get 'areas/:area_id/programas/:id/edit', to: 'areas/programas#edit',  as: 'edit_programa'
  # put '/areas/:area_id/programas/:id', to: 'areas/programas#update'
  

  resources :areas do
    resources :programas, module: :areas
  end

  resources :programas do
    resources :cursos, module: :programas
  end

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
