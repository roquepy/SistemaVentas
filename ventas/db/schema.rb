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

ActiveRecord::Schema.define(:version => 20130518222858) do

  create_table "clientes", :force => true do |t|
    t.string  "nombre",        :null => false
    t.string  "apellido",      :null => false
    t.string  "num_identidad", :null => false
    t.integer "id_localidad",  :null => false
    t.string  "direccion",     :null => false
    t.string  "telefono",      :null => false
    t.string  "sexo",          :null => false
  end

  create_table "condicion_de_pagos", :force => true do |t|
    t.string "nombre_condicion_de_pago", :null => false
  end

  create_table "departamentos", :force => true do |t|
    t.string "nombre", :null => false
  end

  create_table "detalle_factura_venta", :force => true do |t|
    t.integer "id_factura_venta", :null => false
    t.integer "id_producto",      :null => false
    t.integer "cantidad",         :null => false
    t.integer "descuento"
  end

  create_table "estados_funcionarios", :force => true do |t|
    t.string "descripcion", :null => false
  end

  create_table "factura_venta", :force => true do |t|
    t.date    "fecha",                                            :null => false
    t.integer "id_cliente",                                       :null => false
    t.integer "id_condicion_pago",                                :null => false
    t.integer "id_tipo_valor",                                    :null => false
    t.integer "id_funcionario",                                   :null => false
    t.string  "anulado",                                          :null => false
    t.integer "nro_factura",                                      :null => false
    t.decimal "total_descuento",   :precision => 10, :scale => 0, :null => false
    t.decimal "total_iva5",        :precision => 10, :scale => 0, :null => false
    t.decimal "total_iva10",       :precision => 10, :scale => 0, :null => false
    t.decimal "total_iva",         :precision => 10, :scale => 0, :null => false
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

  create_table "productos", :force => true do |t|
    t.integer "codigo",                                         :null => false
    t.string  "descripcion",                                    :null => false
    t.integer "cant_minima",                                    :null => false
    t.integer "cant_optima",                                    :null => false
    t.decimal "precio_unitario", :precision => 10, :scale => 0, :null => false
    t.integer "porcentaje",                                     :null => false
  end

  create_table "tipo_valor_pagos", :force => true do |t|
    t.string "descripcion", :null => false
  end

  create_table "users", :force => true do |t|
    t.string  "username",         :null => false
    t.string  "password"
    t.string  "crypted_password"
    t.string  "salt"
    t.integer "id_funcionario"
  end

end
