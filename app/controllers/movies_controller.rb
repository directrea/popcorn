class MoviesController < ApplicationController
    def index
        @movies = Movie.where(finished: 0)
        @performances =Performance.all

    end

    def search
        @movies = Movie.where(finished: 0).search(params[:title])
        @performances =Performance.where(screening_date: params[:screening_date])
    end

    def show
        @movie = Movie.find(params[:id])
    end


    def bad_request
        raise ActionController::ParameterMissing, ""
      end
    
      def forbidden
        raise Forbidden, ""
      end
    
      def internal_server_error
        raise
      end
    
end
