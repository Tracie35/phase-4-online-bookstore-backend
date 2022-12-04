class UsersController < ApplicationController

    def index
        users = Users.all
        render json: users
    end

    def show
        user = user_finder
        # if power
        render json: user
        # else
        # render json: { error: "Power not found" }, status: :not_found
        # end
    end

    def update
        user = user_finder
        # if power
            user.update!(user_params)
            render json: user
        # else
        #     render json: { error: "Power not found" }, status: :not_found
        # end
    end

    private

        def user_finder
            user = User.find_by(id: params[:id])
        end

        def user_params
            params.permit(:name, :age)
          end

        def render_not_found_response
            render json: { error: "User not found" }, status: :not_found
        end
end
