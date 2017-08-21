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

ActiveRecord::Schema.define(version: 20170821201521) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"

  create_table "areasconocimientos", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_areasconocimientos_on_name", unique: true
  end

  create_table "asignaturas", force: :cascade do |t|
    t.string "name"
    t.integer "areasconocimiento_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_asignaturas_on_name", unique: true
  end

  create_table "books", force: :cascade do |t|
    t.string "title", limit: 32, null: false
    t.float "price"
    t.integer "subject_id"
    t.text "description"
    t.datetime "created_at"
  end

  create_table "cantidadlibros", force: :cascade do |t|
    t.bigint "cantidad"
    t.integer "libro_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "cantidad_total"
  end

  create_table "estudiantes", force: :cascade do |t|
    t.string "name", null: false
    t.string "lastname", null: false
    t.string "matricula", null: false
    t.string "clave", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["matricula"], name: "estudiantes_matricula_key", unique: true
    t.index ["user_id"], name: "estudiantes_user_id_key", unique: true
  end

  create_table "librodescargas", force: :cascade do |t|
    t.integer "libro_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "fecha_descarga"
  end

  create_table "libros", force: :cascade do |t|
    t.string "title", null: false
    t.string "author"
    t.string "edition"
    t.string "publicationdate"
    t.string "casaeditora"
    t.string "description"
    t.integer "asignatura_id", null: false
    t.boolean "fisico"
    t.boolean "digital"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "document_file_name"
    t.string "document_content_type"
    t.integer "document_file_size"
    t.datetime "document_updated_at"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "moras", force: :cascade do |t|
    t.string "valor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prestamos", force: :cascade do |t|
    t.bigint "estudiante_id", null: false
    t.bigint "libro_id", null: false
    t.date "fechap", null: false
    t.date "fechae", null: false
    t.date "fechad"
    t.integer "mora_id"
    t.string "created_by", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "received_by"
  end

  create_table "rols", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_rols_on_name", unique: true
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", default: "", null: false
    t.string "lastname", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rol_id", default: 5, null: false
    t.integer "estudiante_id"
    t.string "created_by"
    t.string "updated_by"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["estudiante_id"], name: "users_estudiante_id_key", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
