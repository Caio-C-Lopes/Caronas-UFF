# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2026_02_19_190351) do

  create_table "campi", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.string "address"
    t.string "number"
    t.string "neighborhood"
    t.string "city"
    t.string "cep"
    t.date "deactivation_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["title"], name: "index_campi_on_title", unique: true
  end

  create_table "campus_caronas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "carona_id", null: false
    t.bigint "campus_id", null: false
    t.string "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["campus_id"], name: "index_campus_caronas_on_campus_id"
    t.index ["carona_id"], name: "index_campus_caronas_on_carona_id"
  end

  create_table "carona_paradas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "carona_id", null: false
    t.bigint "parada_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["carona_id"], name: "index_carona_paradas_on_carona_id"
    t.index ["parada_id"], name: "index_carona_paradas_on_parada_id"
  end

  create_table "caronas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "driver_name"
    t.string "departure"
    t.string "destination"
    t.integer "passengers_number"
    t.decimal "cost", precision: 10, scale: 2
    t.string "obs"
    t.datetime "date_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "paradas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["title"], name: "index_paradas_on_title", unique: true
  end

  add_foreign_key "campus_caronas", "campi"
  add_foreign_key "campus_caronas", "caronas"
  add_foreign_key "carona_paradas", "caronas"
  add_foreign_key "carona_paradas", "paradas"
end
