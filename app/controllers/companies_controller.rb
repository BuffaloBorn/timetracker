class CompaniesController < ApplicationController
    def index
    end

    def show
        @customer_id = params[:id]
        @hello = 'hello there'
    end
end
