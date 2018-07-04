class BuildingsController < ApplicationController
    before_action :set_building, only: [:show, :edit, :update]
    before_action :set_companies, only: [:show]

    def index
        @buildings = Building.all
    end

    def show
    end


    def edit
    end


    def update
    end

    # def destroy
    #     @building.destroy
    # end

    private

    def set_building
        @building = Building.find(params[:id])
    end

    def set_companies
        @companies = @building.companies
    end
end
