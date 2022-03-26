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

ActiveRecord::Schema.define(version: 20161030215642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reclamo_usuarios", force: :cascade do |t|
    t.integer  "reclamo_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reclamo_id"], name: "index_reclamo_usuarios_on_reclamo_id", using: :btree
    t.index ["user_id"], name: "index_reclamo_usuarios_on_user_id", using: :btree
  end

  create_table "reclamos", force: :cascade do |t|
    t.string   "imagen"
    t.string   "titulo"
    t.string   "descripcion"
    t.date     "fecha"
    t.integer  "ubicacion_id"
    t.integer  "tipo_reclamo_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["tipo_reclamo_id"], name: "index_reclamos_on_tipo_reclamo_id", using: :btree
    t.index ["ubicacion_id"], name: "index_reclamos_on_ubicacion_id", using: :btree
    t.index ["user_id"], name: "index_reclamos_on_user_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tipo_reclamos", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ubicacions", force: :cascade do |t|
    t.string   "latitud"
    t.string   "longitud"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id", using: :btree
    t.index ["user_id"], name: "index_user_roles_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "reclamo_usuarios", "reclamos"
  add_foreign_key "reclamo_usuarios", "users"
  add_foreign_key "reclamos", "tipo_reclamos"
  add_foreign_key "reclamos", "ubicacions"
  add_foreign_key "reclamos", "users"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
