# frozen_string_literal: true
Rails.application.routes.draw do
  resources :examples, except: [:new, :edit]
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :users, only: [:index, :show]
  # get '/patients' => 'patients#index' # patients is the controller and index is the method.
  resources :patients, only: [:index, :show, :destroy, :update]  # this is doing the same thing as line 9.  If we didn't include the only, it would automatically create a bunch of routes.  E.g., create, new, edit, etc.  You can check routes by entering bin/rake routes in the terminal.  You could also do except: [:index] which will give you all of those pre-built ones excluding that one.
  resources :doctors, except: [:new, :edit]
end
