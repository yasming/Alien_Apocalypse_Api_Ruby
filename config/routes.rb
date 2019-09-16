Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      
      resources :survivors, :only => [:index, :update, :create];
      post 'survivors/flag/:id', controller: 'survivors', action: 'flag';
      get '/survivors/reports', controller: 'survivors', action: 'reports';

  	end
  end
end
