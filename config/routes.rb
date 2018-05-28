Rails.application.routes.draw do
  root 'welcome#index'

  get 'generate' => 'seed#index'

  # namespace :v1 do
  # end
end
