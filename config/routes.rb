Rails.application.routes.draw do
  devise_for :users
  root 'companies#index'
  get  'recentworks/:days' => 'works#index'
  get 'timetrackerproject/:slug' => 'projects#show'

  resources :companies
  resources :projects
  resources :works
end
