class ReviewsController < ApplicationController

    def index
     reviews = Review.all
     render json: reviews
    end


    def show
        rview = review_finder
        # if power
        render json: review
        # else
        # render json: { error: "Power not found" }, status: :not_found
        # end
    end

    def create
        review = Review.create(review_params)
        if review
            associatedReview = Review.find_by(id: params[:book_id])
            render json: associatedReview
        else
            render json: { errors: "validation errors"}, status: :unprocessable_entity
        
        end
      end

    def update
        review = review_finder
        # if power
            review.update!(book_params)
            render json: review
        # else
        #     render json: { error: "Power not found" }, status: :not_found
        # end
    end

    private

        def review_finder
            review = Review.find_by(id: params[:id])
        end

        def review_params
            params.permit(:user_id, :book_id, :review)
          end

        def render_not_found_response
            render json: { error: "Review not found" }, status: :not_found
        end


end
