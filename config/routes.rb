Rails.application.routes.draw do
   get '/lp' => 'tops#lp'
   #管理者アカウント
   devise_for :admins, controllers: {
     registrations: 'admins/registrations',
     sessions: 'admins/sessions'
   }
   resources :admins, only: [:show]
   #使用者アカウント
   devise_for :users, controllers: {
     registrations: 'users/registrations',
     sessions: 'users/sessions'
   }
   resources :users, only: [:show]

   root to: 'searches#search'

   resources :stores

   resources :searches do
     resources :comments, except:[:index]
     collection do
       get :search
     end
   end

   resources :comments, only:[:index]
end
