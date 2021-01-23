class Admin::MoviesController < Admin::Base
    def index
        @movies = Movie.where(finished: 0)
    end

    def finished
        @movies = Movie.where(finished: 1)
    end

    def search
        @movies = Movie.search(params[:title])
    end

    def show
        @movie = Movie.find(params[:id])
    end

    def new
        @movie = Movie.new()
    end

    def edit
        @movie = Movie.find_by(id: params[:id])
    end

    def create
        @movie = Movie.new(params[:movie])
        if @movie.save
            redirect_to [:admin,@movie]
        else
            render "new"
        end
    end

    def update
        @movie = Movie.find_by(id: params[:id])
        @movie.assign_attributes(params[:movie])
        if @movie.save
        redirect_to :admin_movie, notice: "映画情報を更新しました。"
        else
        render "edit"
        end
    end

    def destroy
        @movie = Movie.find(params[:id])
        if exist_reservation(@movie)
            redirect_to [:admin,@movie], flash: {notice: "予約が存在するため映画を削除できません。"}
        else
            @movie.destroy
            redirect_to admin_movies_path, flash: {notice: "映画名：#{@movie.title}を削除しました。"}
        end
    end

    def exist_reservation(movie)
        movie.performances.each do |pf|
            pf.reservations.each do |r|
                if r.present?
                    return true
                end
            end
        end
        return false
    end
    end
