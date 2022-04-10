Rails.application.routes.draw do
  root to: 'home#index'
  post "/links" => 'links#create'
  #
  get "/:lookup_code" => 'links#show'
  #
  # resources :links
  #
  get    'pay' => 'payeer#show'
  # get    'succesfull'  => 'payeer#succes'
  # get    'edit'  => 'payeer#edit'
  #
  # get '/links/:id/pay_form'
  # get  '/links/:id/show'
  # resource :links, only: [:create, :show] do
  #   get :pay_form, to: 'links_controller#pay'
  #   post :pay_form, to: 'links_controller#create'
  # end
end
