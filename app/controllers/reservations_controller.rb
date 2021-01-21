class ReservationsController < ApplicationController
  before_action :login_required

  layout 'reservations.html.erb'
  def index
    @reservations = Reservation.where(member_id: current_member.id).order(created_at: :desc)
  end

  def show
    check
    @kind = @reservation.kind
  end

  def new
    check
    @reservation = Reservation.new()
  end

  def create
    @performance = Performance.find_by(id: params[:performance_id])
    @seat = Seat.find_by(id: params[:seat_id])
    @performance_seat = PerformanceSeat.new(performance_id: params[:performance_id],seat_id: params[:seat_id])
    if @performance_seat.save
      @reservation = Reservation.new(performance_id: params[:performance_id],
                                    kind_id: params[:reservation][:kind_id])
      @reservation.seats << @seat
      @reservation.member = current_member
      if @reservation.save
        redirect_to movie_performance_seat_reservation_path(id: @reservation.id)
      else
        redirect_to movie_performance_seats_path, notice: "失敗しました。"
      end
    else
      redirect_to movie_performance_seats_path, notice: "既に予約されています。"
    end

  end
end

def check
  @reservation = Reservation.find_by(id:params[:id])
  @seat = Seat.find_by(id:params[:seat_id])
  @performance = Performance.find_by(id:params[:performance_id])
  @movie = Movie.find_by(id:params[:movie_id])
end


# private def seat_params
#   params[:performance_seat][:seat_id]
# end

