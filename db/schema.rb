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

ActiveRecord::Schema.define(version: 20180528161225) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "name50"
    t.string "codcat"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_categories_on_group_id"
  end

  create_table "chapters", force: :cascade do |t|
    t.string "name"
    t.string "name50"
    t.string "numcap"
    t.string "codcap"
    t.string "roman"
    t.string "initial"
    t.string "final"
    t.bigint "cid10_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cid10_id"], name: "index_chapters_on_cid10_id"
  end

  create_table "cid10s", force: :cascade do |t|
    t.string "version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "name50"
    t.string "codgroup"
    t.string "initial"
    t.string "final"
    t.bigint "chapter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chapter_id"], name: "index_groups_on_chapter_id"
  end

  create_table "subcategories", force: :cascade do |t|
    t.string "name"
    t.string "name50"
    t.string "codsubcat"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_subcategories_on_category_id"
  end

  add_foreign_key "categories", "groups"
  add_foreign_key "chapters", "cid10s"
  add_foreign_key "groups", "chapters"
  add_foreign_key "subcategories", "categories"
end
