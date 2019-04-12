Rails.application.routes.draw do
  resources :alarms
  root :to => "alarms#index"
end
