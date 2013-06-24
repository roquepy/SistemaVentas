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

ActiveRecord::Schema.define(:version => 20130618171037) do

  create_table "audits", :force => true do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "change_log"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "audits", ["auditable_id", "auditable_type"], :name => "auditable_index"
  add_index "audits", ["created_at"], :name => "index_audits_on_created_at"
  add_index "audits", ["user_id", "user_type"], :name => "user_index"

  create_table "clientes", :force => true do |t|
    t.string  "nombre",        :limit => 25, :null => false
    t.string  "apellido",      :limit => 25, :null => false
    t.string  "num_identidad", :limit => 15, :null => false
    t.integer "id_localidad",                :null => false
    t.string  "direccion",     :limit => 30, :null => false
    t.string  "telefono",      :limit => 15, :null => false
    t.string  "sexo",          :limit => 1,  :null => false
  end

  add_index "clientes", ["id_localidad"], :name => "clientes_id_localidad_fk"

  create_table "condicion_de_pagos", :force => true do |t|
    t.string "nombre_condicion_de_pago", :limit => 15, :null => false
  end

  create_table "configuracions", :force => true do |t|
    t.string "nombre_logo"
    t.string "logo"
    t.string "nombre_empresa",       :limit => 50, :null => false
    t.string "direccion",            :limit => 50, :null => false
    t.string "telefono",             :limit => 15, :null => false
    t.string "telefono_auxiliar",    :limit => 15
    t.string "ruc",                  :limit => 10, :null => false
    t.string "timbrado",             :limit => 10, :null => false
    t.string "timbrado_vencimiento",               :null => false
  end

  create_table "departamentos", :force => true do |t|
    t.string "nombre", :limit => 35, :null => false
  end

  create_table "detalle_factura_venta", :force => true do |t|
    t.integer "id_factura_venta", :null => false
    t.integer "id_producto",      :null => false
    t.integer "cantidad",         :null => false
    t.integer "descuento"
  end

  create_table "estados_funcionarios", :force => true do |t|
    t.string "descripcion", :limit => 15, :null => false
  end

  create_table "factura_venta", :force => true do |t|
    t.date    "fecha",                                            :null => false
    t.integer "id_cliente",                                       :null => false
    t.integer "id_condicion_pago",                                :null => false
    t.integer "id_tipo_valor",                                    :null => false
    t.integer "id_funcionario",                                   :null => false
    t.integer "nro_factura",                                      :null => false
    t.decimal "total_descuento",   :precision => 10, :scale => 0, :null => false
    t.decimal "total_iva5",        :precision => 10, :scale => 0, :null => false
    t.decimal "total_iva10",       :precision => 10, :scale => 0, :null => false
    t.decimal "total_iva",         :precision => 10, :scale => 0, :null => false
  end

  create_table "funcionarios", :force => true do |t|
    t.string   "num_identidad",         :limit => 15, :null => false
    t.string   "nombres",               :limit => 25, :null => false
    t.string   "apellidos",             :limit => 25, :null => false
    t.string   "direccion",             :limit => 30, :null => false
    t.string   "telefono",              :limit => 15, :null => false
    t.string   "estado_civil",          :limit => 8,  :null => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "sexo",                  :limit => 1,  :null => false
    t.integer  "id_localidad",                        :null => false
    t.integer  "id_estado_funcionario",               :null => false
    t.integer  "id_funcion",                          :null => false
  end

  create_table "funcions", :force => true do |t|
    t.string "nombre", :limit => 30, :null => false
  end

  create_table "localidads", :force => true do |t|
    t.string  "nombre",          :limit => 35, :null => false
    t.integer "id_departamento",               :null => false
  end

  create_table "productos", :force => true do |t|
    t.integer "codigo",          :limit => 8,                                 :null => false
    t.string  "descripcion",     :limit => 30,                                :null => false
    t.integer "cant_minima",                                                  :null => false
    t.integer "cant_optima",                                                  :null => false
    t.decimal "precio_unitario",               :precision => 10, :scale => 0, :null => false
    t.integer "porcentaje",      :limit => 2,                                 :null => false
  end

  create_table "tipo_valor_pagos", :force => true do |t|
    t.string "descripcion", :limit => 50, :null => false
  end

  create_table "users", :force => true do |t|
    t.string  "username",         :limit => 20, :null => false
    t.string  "password",         :limit => 20
    t.string  "crypted_password"
    t.string  "salt"
    t.integer "id_funcionario"
  end

  add_foreign_key "clientes", "localidads", :name => "clientes_id_localidad_fk", :column => "id_localidad"

end
