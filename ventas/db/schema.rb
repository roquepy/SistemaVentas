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

ActiveRecord::Schema.define(:version => 20130627003017) do

  create_table "clientes", :force => true do |t|
    t.string  "nombre",        :limit => 50, :null => false
    t.string  "apellido",      :limit => 50, :null => false
    t.string  "num_identidad", :limit => 15, :null => false
    t.integer "id_localidad",                :null => false
    t.string  "direccion",     :limit => 70, :null => false
    t.string  "telefono",      :limit => 15, :null => false
    t.string  "sexo",          :limit => 15, :null => false
  end

  add_index "clientes", ["id_localidad"], :name => "clientes_id_localidad_fk"

  create_table "condicion_de_pagos", :force => true do |t|
    t.string "nombre_condicion_de_pago", :limit => 15, :null => false
  end

  create_table "configuracions", :force => true do |t|
    t.string "nombre_logo"
    t.string "logo"
  end

  create_table "departamentos", :force => true do |t|
    t.string "nombre", :limit => 30, :null => false
  end

  create_table "depositos", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "detalle_factura_venta", :force => true do |t|
    t.integer "id_factura_venta", :null => false
    t.integer "id_producto",      :null => false
    t.integer "cantidad",         :null => false
    t.integer "descuento"
  end

  add_index "detalle_factura_venta", ["id_factura_venta"], :name => "detalle_factura_venta_id_factura_venta_fk"
  add_index "detalle_factura_venta", ["id_producto"], :name => "detalle_factura_venta_id_producto_fk"

  create_table "detalles_libros_cajas", :force => true do |t|
    t.integer  "id_libro_caja"
    t.integer  "id_funcionario"
    t.integer  "id_tipo_documento"
    t.integer  "nro_asiento"
    t.string   "fecha"
    t.string   "descripcion"
    t.integer  "ingreso"
    t.integer  "egreso"
    t.integer  "nro_documento"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "detalles_libros_cajas", ["id_funcionario"], :name => "detalles_libros_cajas_id_funcionario_fk"
  add_index "detalles_libros_cajas", ["id_libro_caja"], :name => "detalles_libros_cajas_id_libro_caja_fk"
  add_index "detalles_libros_cajas", ["id_tipo_documento"], :name => "detalles_libros_cajas_id_tipo_documento_fk"

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
    t.decimal "monto_total",       :precision => 10, :scale => 0
  end

  add_index "factura_venta", ["id_cliente"], :name => "factura_venta_id_cliente_fk"
  add_index "factura_venta", ["id_condicion_pago"], :name => "factura_venta_id_condicion_pago_fk"
  add_index "factura_venta", ["id_funcionario"], :name => "factura_venta_id_funcionario_fk"
  add_index "factura_venta", ["id_tipo_valor"], :name => "factura_venta_id_tipo_valor_fk"

  create_table "funcionarios", :force => true do |t|
    t.string   "num_identidad"
    t.string   "nombres",               :limit => 50, :null => false
    t.string   "apellidos",             :limit => 50, :null => false
    t.string   "direccion",             :limit => 70
    t.string   "telefono",              :limit => 10, :null => false
    t.string   "estado_civil",          :limit => 10, :null => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "sexo",                  :limit => 15, :null => false
    t.integer  "id_localidad",                        :null => false
    t.integer  "id_estado_funcionario",               :null => false
    t.integer  "id_funcion",                          :null => false
  end

  add_index "funcionarios", ["id_estado_funcionario"], :name => "funcionarios_id_estado_funcionario_fk"
  add_index "funcionarios", ["id_funcion"], :name => "funcionarios_id_funcion_fk"
  add_index "funcionarios", ["id_localidad"], :name => "funcionarios_id_localidad_fk"

  create_table "funcions", :force => true do |t|
    t.string "nombre", :limit => 30, :null => false
  end

  create_table "libros_cajas", :force => true do |t|
    t.integer  "nro_libro_caja"
    t.string   "fecha_inicio"
    t.string   "fecha_fin"
    t.integer  "saldo_inicial"
    t.integer  "saldo_final"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "localidads", :force => true do |t|
    t.string  "nombre",          :limit => 30, :null => false
    t.integer "id_departamento",               :null => false
  end

  add_index "localidads", ["id_departamento"], :name => "localidads_id_departamento_fk"

  create_table "productos", :force => true do |t|
    t.integer "codigo",                                                       :null => false
    t.string  "descripcion",     :limit => 50,                                :null => false
    t.integer "cant_minima",                                                  :null => false
    t.integer "cant_optima",                                                  :null => false
    t.decimal "precio_unitario",               :precision => 10, :scale => 0, :null => false
    t.integer "porcentaje",                                                   :null => false
  end

  create_table "stock", :force => true do |t|
    t.integer  "id_deposito"
    t.integer  "id_producto"
    t.integer  "cantidad"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "stock", ["id_deposito"], :name => "stock_id_deposito_fk"
  add_index "stock", ["id_producto"], :name => "stock_id_producto_fk"

  create_table "tipo_valor_pagos", :force => true do |t|
    t.string "descripcion", :limit => 50, :null => false
  end

  create_table "tipos_documentos", :force => true do |t|
    t.string   "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string  "username",         :limit => 20, :null => false
    t.string  "password",         :limit => 20
    t.string  "crypted_password"
    t.string  "salt"
    t.integer "id_funcionario"
  end

  add_index "users", ["id_funcionario"], :name => "users_id_funcionario_fk"

  add_foreign_key "clientes", "localidads", :name => "clientes_id_localidad_fk", :column => "id_localidad"

  add_foreign_key "detalle_factura_venta", "factura_venta", :name => "detalle_factura_venta_id_factura_venta_fk", :column => "id_factura_venta"
  add_foreign_key "detalle_factura_venta", "productos", :name => "detalle_factura_venta_id_producto_fk", :column => "id_producto"

  add_foreign_key "detalles_libros_cajas", "funcionarios", :name => "detalles_libros_cajas_id_funcionario_fk", :column => "id_funcionario"
  add_foreign_key "detalles_libros_cajas", "libros_cajas", :name => "detalles_libros_cajas_id_libro_caja_fk", :column => "id_libro_caja"
  add_foreign_key "detalles_libros_cajas", "tipos_documentos", :name => "detalles_libros_cajas_id_tipo_documento_fk", :column => "id_tipo_documento"

  add_foreign_key "factura_venta", "clientes", :name => "factura_venta_id_cliente_fk", :column => "id_cliente"
  add_foreign_key "factura_venta", "condicion_de_pagos", :name => "factura_venta_id_condicion_pago_fk", :column => "id_condicion_pago"
  add_foreign_key "factura_venta", "funcionarios", :name => "factura_venta_id_funcionario_fk", :column => "id_funcionario"
  add_foreign_key "factura_venta", "tipo_valor_pagos", :name => "factura_venta_id_tipo_valor_fk", :column => "id_tipo_valor"

  add_foreign_key "funcionarios", "estados_funcionarios", :name => "funcionarios_id_estado_funcionario_fk", :column => "id_estado_funcionario"
  add_foreign_key "funcionarios", "funcions", :name => "funcionarios_id_funcion_fk", :column => "id_funcion"
  add_foreign_key "funcionarios", "localidads", :name => "funcionarios_id_localidad_fk", :column => "id_localidad"

  add_foreign_key "localidads", "departamentos", :name => "localidads_id_departamento_fk", :column => "id_departamento"

  add_foreign_key "stock", "depositos", :name => "stock_id_deposito_fk", :column => "id_deposito"
  add_foreign_key "stock", "productos", :name => "stock_id_producto_fk", :column => "id_producto"

  add_foreign_key "users", "funcionarios", :name => "users_id_funcionario_fk", :column => "id_funcionario"

end
