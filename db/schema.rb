# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_12_073946) do

  create_table "kinds", force: :cascade do |t|
    t.string "kind_name", null: false
    t.integer "fee", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "user_name", null: false
    t.string "full_name", null: false
    t.string "email", null: false
    t.date "birthday", null: false
    t.integer "sex", default: 0, null: false
    t.integer "credit_number", null: false
    t.date "expiration_date", null: false
    t.integer "authentication_number", null: false
    t.boolean "administrator"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title", null: false
    t.text "story", null: false
    t.datetime "release_date", null: false
    t.integer "running_time", null: false
    t.string "distribution", null: false
    t.string "director", null: false
    t.text "actor", null: false
    t.integer "finished", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "performance_seats", force: :cascade do |t|
    t.integer "performance_id", null: false
    t.integer "seat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["performance_id"], name: "index_performance_seats_on_performance_id"
    t.index ["seat_id"], name: "index_performance_seats_on_seat_id"
  end

  create_table "performances", force: :cascade do |t|
    t.integer "movie_id", null: false
    t.date "screening_date", null: false
    t.time "start_time", null: false
    t.time "end_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_performances_on_movie_id"
  end

  create_table "reservation_seats", force: :cascade do |t|
    t.integer "reservation_id", null: false
    t.integer "seat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reservation_id"], name: "index_reservation_seats_on_reservation_id"
    t.index ["seat_id"], name: "index_reservation_seats_on_seat_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "member_id", null: false
    t.integer "performance_id", null: false
    t.integer "kind_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kind_id"], name: "index_reservations_on_kind_id"
    t.index ["member_id"], name: "index_reservations_on_member_id"
    t.index ["performance_id"], name: "index_reservations_on_performance_id"
  end

  create_table "seats", force: :cascade do |t|
    t.string "en_number"
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
