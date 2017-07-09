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

ActiveRecord::Schema.define(version: 20170708061701) do

  create_table "clients", force: :cascade do |t|
    t.string   "nombre",     limit: 105
    t.string   "apellido_p", limit: 105
    t.string   "apellido_m", limit: 105
    t.string   "RFC",        limit: 15
    t.integer  "active",     limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "financing_models", force: :cascade do |t|
    t.string   "descripcion", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "financing_types", force: :cascade do |t|
    t.string   "descripcion", limit: 255
    t.integer  "dias",        limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "descripcion", limit: 500
    t.string   "modelo",      limit: 200
    t.decimal  "precio",                  precision: 8, scale: 2
    t.integer  "existencia",  limit: 4
    t.integer  "active",      limit: 4
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  create_table "items_solds", force: :cascade do |t|
    t.integer  "id_sale",    limit: 4
    t.integer  "cantidad",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "modulos", force: :cascade do |t|
    t.string   "nombre",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "paid_systems", force: :cascade do |t|
    t.string   "descripcion", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "sales", force: :cascade do |t|
    t.integer  "id_client",           limit: 4
    t.integer  "id_financing_models", limit: 4
    t.integer  "id_financing_types",  limit: 4
    t.integer  "id_paid_systems",     limit: 4
    t.integer  "cantidad_pagos",      limit: 4
    t.decimal  "pago_diferido",                   precision: 8, scale: 2
    t.decimal  "total_venta",                     precision: 8, scale: 2
    t.date     "fecha_venta"
    t.string   "estatus",             limit: 255
    t.integer  "active",              limit: 4
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
  end

  create_table "screens", force: :cascade do |t|
    t.string   "nombre",     limit: 255
    t.string   "link",       limit: 255
    t.integer  "modulo_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "settings", force: :cascade do |t|
    t.decimal  "tasa_financiamiento",           precision: 8, scale: 2
    t.decimal  "porcentaje_enganche",           precision: 4, scale: 2
    t.decimal  "plazo_maximo",                  precision: 8, scale: 2
    t.integer  "active",              limit: 4
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
  end

end
