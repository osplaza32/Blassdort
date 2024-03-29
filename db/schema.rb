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

ActiveRecord::Schema.define(version: 20180215024230) do

  create_table "dia", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "empresas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre"
    t.integer "npuertas"
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

  create_table "permisos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "horarios"
    t.bigint "usuario_id"
    t.bigint "puerta_id"
    t.bigint "dia_id"
    t.bigint "horario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dia_id"], name: "index_permisos_on_dia_id"
    t.index ["horario_id"], name: "index_permisos_on_horario_id"
    t.index ["puerta_id"], name: "index_permisos_on_puerta_id"
    t.index ["usuario_id"], name: "index_permisos_on_usuario_id"
  end

  create_table "puerta", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "descr"
    t.string "horafiinicio"
    t.string "horafifin"
    t.bigint "empresa_id"
    t.bigint "hardware_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["empresa_id"], name: "index_puerta_on_empresa_id"
    t.index ["hardware_id"], name: "index_puerta_on_hardware_id"
  end

  create_table "usuarios", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "ntarjeta"
    t.string "nombre"
    t.string "email"
    t.string "apellido"
    t.string "cargo"
    t.string "foto"
    t.string "telefono"
    t.string "role"
    t.string "conectado"
    t.string "password_digest"
    t.string "pincode"
    t.bigint "empresa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["empresa_id"], name: "index_usuarios_on_empresa_id"
  end

end
