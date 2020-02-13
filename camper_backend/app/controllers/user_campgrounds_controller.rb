class UserCampgroundsController < ApplicationController
    def index
        @user_campgrounds = UserCampground.all
        render json: @user_campgrounds, include: [:campground, :user]
    end

    def show
        @user_campground = UserCampground.find(params[:id])
        render json: @user_campground
    end

    def create
        @user_campground = UserCampground.create(
            user_id: params[:user_id],
            campground_id: params[:campground_id],
            camping_duration: params[:camping_duration]
        )
        # render json: @user_campground
        redirect_back(fallback_location: "http://localhost:3001")
    end
 
    def update
        @user_campground = UserCampground.find(params[:id])
        @user_campground.update(
            camping_duration: params[:camping_duration]
        )
        # render json: @user_campground
        redirect_back(fallback_location: "http://localhost:3001")
    end

    def destroy
        @user_campground = UserCampground.find(params[:id])
        @user_campground.destroy

        redirect_back(fallback_location: "http://localhost:3001")
    end
end
