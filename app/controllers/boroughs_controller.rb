class BoroughsController < ApplicationController
    def index
        @boroughs = Borough.all
        render json: @boroughs
    end
end
