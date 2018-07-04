class BuildingsController < ApplicationController
    before_action :set_building, only: [:show, :edit, :update]
    before_action :set_companies, only: [:show]

    def index
        @buildings = Building.all
    end

    def show
    end


    def edit
        @companies = Company.all
    end


    def update
        @building.update(building_params)
        if @building.valid?
            redirect_to @building
        else
            flash[:errors] = @building.errors.full_messages
            redirect_to edit_building_path
        end
    end

    # def destroy
    #     @building.destroy
    # end

    private

    def building_params
        params.require(:building).permit(:name, :country, :address, :rent_per_floor, :number_of_floors, company_ids:[])
    end

    def set_building
        @building = Building.find(params[:id])
    end

    def set_companies
        @building_companies = @building.companies
    end
end
