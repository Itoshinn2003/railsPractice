Rails.application.routes.draw do
  
  
  get 'hello/index'
  get 'hello', to: 'hello#index'
  get 'hello/other'
end
