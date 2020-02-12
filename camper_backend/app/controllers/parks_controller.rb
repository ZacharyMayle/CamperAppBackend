class ParksController < ApplicationController
    def index
        @parks = Park.all
        render json: @parks, include: [:campgrounds]
    end

    def show
        @park = Park.find(params[:id])
        render json: @park, include: [:campgrounds]
    end
end
