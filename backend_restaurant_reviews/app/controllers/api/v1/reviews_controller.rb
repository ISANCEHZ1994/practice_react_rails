module Api # we want to namespace these inside of a module
    module V1 # similar to what we did in the routes
        class ReviewsController < ApplicationController

            def create
                review = Review.new(review_params)

                if review.save
                    render json: ReviewSerializer.new(review).serialized_json
                else 
                    render json: { error: review.errors.messages }, status: 422
                end
            end

            def destroy
                review = Review.find_by(params[:id])

                if review.destroy
                    head :no_content
                else 
                    render json: { error: review.errors.messages }, status: 422
                 end
            end

            private
            def review_params
                params.require(:review).permit(:title, :description, :score, :restaurant_id)
            end


        end
    end
end