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
            associatedBook = Review.find_by(id: params[:book_id])
            render json: associatedBook
        else
            render json: { errors: "validation errors"}, status: :unprocessable_entity
        
        end
      end

    #decide if we really need this 
      def update
        review = review_finder
        # if power
            review.update!(review_params)
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
            params.permit(:user_id, :book_id, :comment)
          end

        def render_not_found_response
            render json: { error: "Review not found" }, status: :not_found
        end


end
