ActiveRecord::Schema.define(version: 2021_05_15_174606) do

    create_table "comments", force: :cascade do |t|
      t.text "content"
      t.integer "task_id", null: false
      t.integer "user_id", null: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["task_id"], name: "index_comments_on_task_id"
      t.index ["user_id"], name: "index_comments_on_user_id"
    end
  
    create_table "logs", force: :cascade do |t|
      t.integer "task_id"
      t.text "message"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
  
    create_table "tasks", force: :cascade do |t|
      t.text "title", null: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.string "slug", null: false
      t.integer "user_id"
      t.integer "creator_id"
      t.integer "progress", default: 0, null: false
      t.integer "status", default: 0, null: false
      t.index ["slug"], name: "index_tasks_on_slug", unique: true
    end
  
    create_table "users", force: :cascade do |t|
      t.string "name", null: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.string "email", null: false
      t.string "password_digest", null: false
      t.string "authentication_token"
      t.index ["email"], name: "index_users_on_email", unique: true
    end
  
    add_foreign_key "comments", "tasks"
    add_foreign_key "comments", "users"
    add_foreign_key "tasks", "users", on_delete: :cascade
  end
  