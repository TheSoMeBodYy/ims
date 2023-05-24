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

ActiveRecord::Schema[7.0].define(version: 2019_06_13_112016) do
  create_table "allotments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "item_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.datetime "dealloted_at", precision: nil
    t.integer "allotment_quantity"
    t.index ["item_id"], name: "index_allotments_on_item_id"
    t.index ["user_id"], name: "index_allotments_on_user_id"
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "manufacturer"
    t.string "manufacturer_email"
    t.string "manufacturer_office"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "description"
  end

  create_table "issues", force: :cascade do |t|
    t.integer "user_id"
    t.integer "item_id"
    t.text "issue_description"
    t.datetime "solved_at", precision: nil
    t.text "feedback"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["item_id"], name: "index_issues_on_item_id"
    t.index ["user_id"], name: "index_issues_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.integer "brand_id"
    t.integer "category_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "in_stock"
    t.decimal "price"
    t.integer "minimum_required_stock"
    t.integer "procurement_time_in_weeks"
    t.string "quantity"
    t.integer "total_stock"
    t.index ["brand_id"], name: "index_items_on_brand_id"
    t.index ["category_id"], name: "index_items_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "mobile_no"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "allotments", "items"
  add_foreign_key "allotments", "users"
  add_foreign_key "issues", "items"
  add_foreign_key "issues", "users"
  add_foreign_key "items", "brands"
  add_foreign_key "items", "categories"
end
