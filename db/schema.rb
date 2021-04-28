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

ActiveRecord::Schema.define(version: 2021_04_28_002728) do

  create_table "project_tools", force: :cascade do |t|
    t.string "warehouse_location"
    t.integer "tool_id"
    t.integer "project_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_project_tools_on_project_id"
    t.index ["tool_id"], name: "index_project_tools_on_tool_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "location"
    t.date "start_date"
    t.date "end_date"
    t.string "description"
    t.integer "revenue_estimate"
    t.integer "cost_estimate"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.integer "users_id"
    t.integer "projects_id"
    t.integer "site_manager_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["projects_id"], name: "index_teams_on_projects_id"
    t.index ["users_id"], name: "index_teams_on_users_id"
  end

  create_table "tools", force: :cascade do |t|
    t.string "item_name"
    t.text "description"
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", null: false
    t.string "password_digest"
    t.integer "role", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "projects", "users"
end
