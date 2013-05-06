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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130506143011) do

  create_table "departamentos", :force => true do |t|
    t.string "nombre", :null => false
  end

  create_table "estados_funcionarios", :force => true do |t|
    t.string "descripcion", :null => false
  end

  create_table "funcionarios", :force => true do |t|
    t.string   "num_identidad"
    t.string   "nombres",               :null => false
    t.string   "apellidos",             :null => false
    t.string   "direccion"
    t.string   "telefono",              :null => false
    t.string   "estado_civil",          :null => false
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "sexo",                  :null => false
    t.integer  "id_localidad",          :null => false
    t.integer  "id_estado_funcionario", :null => false
    t.integer  "id_funcion",            :null => false
  end

  create_table "funcions", :force => true do |t|
    t.string "nombre", :null => false
  end

  create_table "localidads", :force => true do |t|
    t.string  "nombre",          :null => false
    t.integer "id_departamento", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "nombre",           :null => false
    t.string   "clave"
    t.string   "crypted_password"
    t.string   "salt"
    t.integer  "id_funcionario"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
