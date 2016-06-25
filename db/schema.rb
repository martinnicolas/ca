# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160614233413) do

  create_table "reclamo_usuarios", force: :cascade do |t|
    t.integer  "reclamo_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "reclamo_usuarios", ["reclamo_id"], name: "index_reclamo_usuarios_on_reclamo_id", using: :btree
  add_index "reclamo_usuarios", ["user_id"], name: "index_reclamo_usuarios_on_user_id", using: :btree

  create_table "reclamos", force: :cascade do |t|
    t.string   "imagen",          limit: 255
    t.string   "titulo",          limit: 255
    t.string   "descripcion",     limit: 255
    t.date     "fecha"
    t.integer  "ubicacion_id",    limit: 4
    t.integer  "tipo_reclamo_id", limit: 4
    t.integer  "user_id",         limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "reclamos", ["tipo_reclamo_id"], name: "index_reclamos_on_tipo_reclamo_id", using: :btree
  add_index "reclamos", ["ubicacion_id"], name: "index_reclamos_on_ubicacion_id", using: :btree
  add_index "reclamos", ["user_id"], name: "index_reclamos_on_user_id", using: :btree

  create_table "tipo_reclamos", force: :cascade do |t|
    t.string   "nombre",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "ubicacions", force: :cascade do |t|
    t.string   "latitud",    limit: 255
    t.string   "longitud",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "reclamo_usuarios", "reclamos"
  add_foreign_key "reclamo_usuarios", "users"
  add_foreign_key "reclamos", "tipo_reclamos"
  add_foreign_key "reclamos", "ubicacions"
  add_foreign_key "reclamos", "users"
end
