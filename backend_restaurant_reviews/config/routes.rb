Rails.application.routes.draw do
    root 'pages#index'
 
    namespace :api do # https://paweljw.github.io/2017/07/rails-5.1-api-app-part-3-api-versioning/
      namespace :v1 do 
        # Upon research we are versioning it to make it updateable
        resources :restaurants, param: :slug 
        # Here we are specifcying what params we want it to use - in this case slug INSTEAD of id
        resources :reviews, only: [:create, :destroy]
      end
    end

    get '*path', to: 'pages#index', via: :all 
    # Will route requests that aren't for exsiting paths predefined in our API BACK to index path
    # Once React-Router plays a role - this will allow us to handle routing to React Components 
    # Without interfering with actual Rails routes for API
end
