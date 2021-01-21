class SeatsController < ApplicationController
    layout 'reservations.html.erb'

    def index
        @reserved = PerformanceSeat.where(performance_id: params[:performance_id])
    end    
end
