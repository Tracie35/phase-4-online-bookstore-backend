class BooksController < ApplicationController

    def index
        books = Book.all
        render json: books
    end

      
   
    private

        def book_finder
            book = Book.find_by(id: params[:id])
        end

        def book_params
            params.permit(:title, :author, :genre, :image, :price, :description)
          end

        def render_not_found_response
            render json: { error: "Book not found" }, status: :not_found
        end

    
end
