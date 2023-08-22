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

ActiveRecord::Schema[7.0].define(version: 2022_09_19_105356) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_trgm"
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "job_statuses", ["pending", "success", "error", "warning"]
  create_enum "user_types", ["admin"]

  create_table "job_runs", primary_key: ["name", "created_at"], force: :cascade do |t|
    t.bigserial "id", null: false
    t.string "name", limit: 256, null: false
    t.enum "status", default: "pending", null: false, enum_type: "job_statuses"
    t.datetime "completed_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "error_message", limit: 256
    t.text "error_detail"
    t.index ["completed_at"], name: "index_job_runs_on_completed_at"
    t.index ["created_at"], name: "index_job_runs_on_created_at"
    t.index ["id"], name: "index_job_runs_on_id"
    t.index ["name"], name: "index_job_runs_on_name_gin", opclass: :gin_trgm_ops, using: :gin
    t.index ["name"], name: "index_job_runs_on_name_hash", using: :hash
  end

  create_table "job_runs_y2023_m7", primary_key: ["name", "created_at"], force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('job_runs_id_seq'::regclass)" }, null: false
    t.string "name", limit: 256, null: false
    t.enum "status", default: "pending", null: false, enum_type: "job_statuses"
    t.datetime "completed_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "error_message", limit: 256
    t.text "error_detail"
    t.index ["completed_at"], name: "job_runs_y2023_m7_completed_at_idx"
    t.index ["created_at"], name: "job_runs_y2023_m7_created_at_idx"
    t.index ["id"], name: "job_runs_y2023_m7_id_idx"
    t.index ["name"], name: "job_runs_y2023_m7_name_idx", using: :hash
    t.index ["name"], name: "job_runs_y2023_m7_name_idx1", opclass: :gin_trgm_ops, using: :gin
  end

  create_table "job_runs_y2023_m8", primary_key: ["name", "created_at"], force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('job_runs_id_seq'::regclass)" }, null: false
    t.string "name", limit: 256, null: false
    t.enum "status", default: "pending", null: false, enum_type: "job_statuses"
    t.datetime "completed_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "error_message", limit: 256
    t.text "error_detail"
    t.index ["completed_at"], name: "job_runs_y2023_m8_completed_at_idx"
    t.index ["created_at"], name: "job_runs_y2023_m8_created_at_idx"
    t.index ["id"], name: "job_runs_y2023_m8_id_idx"
    t.index ["name"], name: "job_runs_y2023_m8_name_idx", using: :hash
    t.index ["name"], name: "job_runs_y2023_m8_name_idx1", opclass: :gin_trgm_ops, using: :gin
  end

  create_table "job_runs_y2023_m9", primary_key: ["name", "created_at"], force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('job_runs_id_seq'::regclass)" }, null: false
    t.string "name", limit: 256, null: false
    t.enum "status", default: "pending", null: false, enum_type: "job_statuses"
    t.datetime "completed_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "error_message", limit: 256
    t.text "error_detail"
    t.index ["completed_at"], name: "job_runs_y2023_m9_completed_at_idx"
    t.index ["created_at"], name: "job_runs_y2023_m9_created_at_idx"
    t.index ["id"], name: "job_runs_y2023_m9_id_idx"
    t.index ["name"], name: "job_runs_y2023_m9_name_idx", using: :hash
    t.index ["name"], name: "job_runs_y2023_m9_name_idx1", opclass: :gin_trgm_ops, using: :gin
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.enum "user_type", default: "admin", null: false, enum_type: "user_types"
    t.datetime "last_seen_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name_gin", opclass: :gin_trgm_ops, using: :gin
    t.index ["name"], name: "index_users_on_name_hash", using: :hash
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
