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

ActiveRecord::Schema.define(version: 20180207192613) do

  create_table "empresas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre"
    t.string "puertas"
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hardwares", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nserial"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "horarios", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "inicio"
    t.string "fin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "metricas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "usuario"
    t.integer "puerta"
    t.date "momento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "puerta", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "descr"
    t.string "horafiinicio"
    t.string "horafifin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre"
    t.string "email"
    t.string "apellido"
    t.string "cargo"
    t.string "foto"
    t.string "telefono"
    t.string "conectado"
    t.string "password"
    t.string "pincode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
