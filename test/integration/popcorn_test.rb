require 'test_helper'

class PopcornTest < ActionDispatch::IntegrationTest
    test "cannot reserve sold_seat" do
        post "/session", params:{ name:"Taro",password: "pop"}
        assert_difference "Reservation.count", +0 do
            post "/movies/1/performances/1/seats/1/reservations",params: {
                performance_seat: {
                    seat_id: 1,
                    performance_id: 1
                }
            }
        end
        assert_response :redirect
    end
end