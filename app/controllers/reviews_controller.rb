class ReviewsController < ApplicationController

    def index
     reviews = Review.all
     render json: reviews
    end


    def show
        book = review_finder
        render json: book
    end



    def create
        review = Review.create!(review_params)
        if review
            associatedBook = Review.find_by(id: params[:book_id])
            render json: associatedBook
        else
            render json: { errors: "validation errors"}, status: :unprocessable_entity
        
        end
      end

    
    def update
       review = review_finder
       review.update!(update_review)
       render json: review
    
    end

    private

        def review_finder
            review = Review.find(params[:id]) 
        end

        def review_params
            params.permit(:user_id, :book_id, :comment)
          end

        def render_not_found_response
            render json: { error: "Review not found" }, status: :not_found
        end

       



end
