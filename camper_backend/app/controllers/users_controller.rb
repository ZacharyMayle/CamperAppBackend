class UsersController < ApplicationController
    
    def index
        @users = User.all
        render json: @users
    end
    
    def show
        @user = User.find(params[:id])
        redner json: @user
    end
    
    def create
        @user = User.create(
            first_name: params[:first_name],
            last_name: params[:last_name],
            current_state: params[:current_state]
        )
        render json: @user
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
