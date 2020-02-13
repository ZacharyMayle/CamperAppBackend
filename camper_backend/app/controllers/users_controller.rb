class UsersController < ApplicationController
    
    def index
        @users = User.all
        render json: @users
    end
    
    def show
        @user = User.find(params[:id])
        render json: @user, include: [:user_campgrounds]
    end
    
    def create
        @user = User.create(
            first_name: params[:first_name],
            last_name: params[:last_name],
            current_state: params[:current_state]
        )
        # render json: @user
        redirect_to "http://localhost:3001/"
    end
    
    def update
        @user = User.find(params[:id])

        @user.update(
            first_name: params[:first_name],
            last_name: params[:last_name],
            current_state: params[:current_state]
        )

        render json: @user
    end
    
    def delete
        @user = find(params[:id])

        @user.destroy

        render body: nil, status: :no_content 
    end
end
