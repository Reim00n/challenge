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

ActiveRecord::Schema[7.0].define(version: 2023_09_22_043406) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "clientes", force: :cascade do |t|
    t.string "nombre"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clientes_preferencia", force: :cascade do |t|
    t.bigint "cliente_id", null: false
    t.bigint "preferencia_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_clientes_preferencia_on_cliente_id"
    t.index ["preferencia_id"], name: "index_clientes_preferencia_on_preferencia_id"
  end

  create_table "encuestas", force: :cascade do |t|
    t.string "nombre_encuesta"
    t.integer "estado_encuesta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "preferencia_id", null: false
    t.index ["preferencia_id"], name: "index_encuestas_on_preferencia_id"
  end

  create_table "formularios", force: :cascade do |t|
    t.bigint "encuesta_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["encuesta_id"], name: "index_formularios_on_encuesta_id"
  end

  create_table "formularios_pregunta", force: :cascade do |t|
    t.bigint "formulario_id", null: false
    t.bigint "pregunta_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["formulario_id"], name: "index_formularios_pregunta_on_formulario_id"
    t.index ["pregunta_id"], name: "index_formularios_pregunta_on_pregunta_id"
  end

  create_table "preferencias", force: :cascade do |t|
    t.string "texto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preguntas", force: :cascade do |t|
    t.string "texto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "respuestas", force: :cascade do |t|
    t.bigint "cliente_id", null: false
    t.bigint "formulario_pregunta_id", null: false
    t.integer "valor_respuesta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_respuestas_on_cliente_id"
    t.index ["formulario_pregunta_id"], name: "index_respuestas_on_formulario_pregunta_id"
  end

  create_table "usuarios", force: :cascade do |t|
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
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  add_foreign_key "clientes_preferencia", "clientes"
  add_foreign_key "clientes_preferencia", "preferencias"
  add_foreign_key "encuestas", "preferencias"
  add_foreign_key "formularios", "encuestas"
  add_foreign_key "formularios_pregunta", "formularios"
  add_foreign_key "formularios_pregunta", "preguntas"
  add_foreign_key "respuestas", "clientes"
  add_foreign_key "respuestas", "formularios_pregunta"
end
