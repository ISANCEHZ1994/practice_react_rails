module API # we want to namespace these inside of a module
    module V1 # similar to what we did in the routes
        class ReviewsController < ApplicationController

            def create
                review = Review.new()
            end

            def destroy

            end

            private
            def review_params
                params.require(:review)
            end


        end
    end
end