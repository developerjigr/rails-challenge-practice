class CompaniesController < ApplicationController
    before_action :set_company, only: [:show]

    def index
        @companies = Company.all
    end

    def show
        @offices = @company.offices
    end

    def new
        @company = Company.new
    end

    def create

        company = Company.create(name:params[:company])

        if @company.valid?
            redirect_to @company
        else
            redirect_to new_company_path
        end
    end

    private

    def company_params
        params.require(:company)
    end

    def set_company
        @company = Company.find(params[:id])
    end

    def set_offices
        @offices = @company.offices
    end
end
