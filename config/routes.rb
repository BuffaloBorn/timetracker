Rails.application.routes.draw do
  root 'companies#index'
  get  'recentworks/:days' => 'works#index'
  get 'timetrackerproject/:slug' => 'projects#show'

  resources :companies
  resources :projects
  resources :works
end
