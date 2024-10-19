Rails.application.routes.draw do
  get 'people/index'
  
  
  get 'hello/index'
  get 'hello', to: 'hello#index'
  get 'hello/other'
  post 'hello', to: 'hello#index'
  post 'hello/index'
  get 'people/index'
end
