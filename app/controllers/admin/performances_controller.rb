class Admin::PerformancesController < Admin::Base
  require'date'
  def index
    @performances = Performance.where(movie_id: params[:movie_id]).order(:screening_date).order(:start_time)
    @performance = Performance.new(movie_id: params[:id])
  end

  def create
    @performance = Performance.new(performance_params)
    @movie = Movie.find_by(id: params[:movie_id])
    @performance[:end_time] = @performance.start_time + @movie.running_time.minute
    @performance.movie = @movie
    if @performance.save!
      redirect_to admin_movie_performances_url, notice: "登録しました"
    else
      redirect_to admin_movie_performances_url
    end
    # hash= params[:performance]
    # hash["movie_id"] = params[:id]
    #   @performance = Performance.create(hash)
    #   redirect_to movie_performances_url
    #   logger.debug @performance.errors.inspect 
  end

    def destroy
      @performance = Performance.find(params[:id])
      @performance.destroy
      redirect_to admin_movie_performances_path
    end

    private def performance_params
      params.require(:performance)
    end
end
