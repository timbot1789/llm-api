# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_06_08_055540) do
  create_table "affirmations", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
    t.integer "visitor_pokemon_id", null: false
    t.index ["visitor_pokemon_id"], name: "index_affirmations_on_visitor_pokemon_id"
  end

  create_table "haikus", force: :cascade do |t|
    t.text "body"
    t.integer "visitor_pokemon_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["visitor_pokemon_id"], name: "index_haikus_on_visitor_pokemon_id"
  end

  create_table "horoscopes", force: :cascade do |t|
    t.text "body"
    t.integer "visitor_pokemon_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["visitor_pokemon_id"], name: "index_horoscopes_on_visitor_pokemon_id"
  end

  create_table "mantras", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
    t.integer "visitor_pokemon_id", null: false
    t.index ["visitor_pokemon_id"], name: "index_mantras_on_visitor_pokemon_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "url"
    t.string "name"
    t.string "sprite"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prayers", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
    t.integer "visitor_pokemon_id", null: false
    t.index ["visitor_pokemon_id"], name: "index_prayers_on_visitor_pokemon_id"
  end

  create_table "visitor_pokemons", force: :cascade do |t|
    t.date "date"
    t.integer "visitor_id", null: false
    t.integer "pokemon_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pokemon_id"], name: "index_visitor_pokemons_on_pokemon_id"
    t.index ["visitor_id"], name: "index_visitor_pokemons_on_visitor_id"
  end

  create_table "visitors", force: :cascade do |t|
    t.string "ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "affirmations", "visitor_pokemons"
  add_foreign_key "haikus", "visitor_pokemons"
  add_foreign_key "horoscopes", "visitor_pokemons"
  add_foreign_key "mantras", "visitor_pokemons"
  add_foreign_key "prayers", "visitor_pokemons"
  add_foreign_key "visitor_pokemons", "pokemons"
  add_foreign_key "visitor_pokemons", "visitors"
end
