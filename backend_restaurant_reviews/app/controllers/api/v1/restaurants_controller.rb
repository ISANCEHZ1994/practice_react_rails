module API # we want to namespace these inside of a module
    module V1 # similar to what we did in the routes
        class RestaurantsController < ApplicationController # Regular class in Ruby
            def index
                restaurants = Restaurant.all 
                render json: RestaurantSerializer.new(restaurants, options).serialized_json
                # When using Fast JSONAPI we have to be specifc about the data we want to view
            end

            def show
                restaurant = Restaurant.find_by(slug: params[:slug]) # We want to find by slug - in this case params slug
                render json: RestaurantSerializer.new(restaurant, options).serialized_json
            end

            def create
                restaurant = Restaurant.new(restaurant_params)

                if restaurant.save
                    render json: RestaurantSerializer.new(restaurant).serialized_json
                else 
                    render json: { error: restaurant.errors.messages }, status: 422 # specifcying the status
                end
            end

            def update
                restaurant = Restaurant.find_by(slug: params[:slug])

                if restaurant.update(restaurant_params)
                    render json: RestaurantSerializer.new(restaurant, options).serialized_json
                else 
                    render json: { error: restaurant.errors.messages }, status: 422
                end
            end

            def destroy
                restaurant = Restaurant.find_by(slug: params[:slug])

                if restaurant.destroy(restaurant_params)
                    head :no_content
                else 
                    render json: { error: restaurant.errors.messages }, status: 422
                end
            end

            private  
            def restaurant_params # we are creating a list of parameters that we allow when creating a new restaurant
                params.require(:restaurant).permit(:name,:image_url)
            end

            def options # Using FastJSONAPI compound document -
            # we want to make sure that we include any associated Review data for that Restaurant
                @options ||= { include:  %i[reviews] } # take the method and initialize our serializers
            end
 
        end
    end
end