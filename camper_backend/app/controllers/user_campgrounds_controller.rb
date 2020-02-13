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
            user: params[:user],
            campground: params[:campground],
            camping_duration: params[:camping_duration]
        )
        render json: @user_campground
    end

    def update
        @user_campground = UserCampground.find(params[:id])
        @user_campground.update(
            user: params[:user],
            campground: params[:campground],
            camping_duration: params[:camping_duration]
        )
        render json: @user_campground
    end

    def delete
        @user_campground = UserCampground.find(params[:id])
        @user_campground.destroy

        render body: nil, status: :no_content
    end
end
