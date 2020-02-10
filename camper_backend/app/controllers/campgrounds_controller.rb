class CampgroundsController < ApplicationController
    
    def show
        campground = Campground.find(params[:id])
        render json: campground
    end

    def index
        campgrounds = Campground.all
        render json: campgrounds
    end

end
