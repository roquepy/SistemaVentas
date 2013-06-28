require 'custom_logger'

class HelpsController < ApplicationController
  
  def index
    @link = [
      "Como ingresar al Sistema de Ventas?",
      "Como registrar un Cliente?",
      "Como ver e imprimir o descargar la Lista de Cliente?",
      "Como registrar una Venta/Facturacion?",
      "Como ver e imprimir o descargar la Lista de Facturas?",
      "Como registrar un Producto?",
      "Como ver e imprimir o descargar la Lista de Productos?",
      "Como registrar un Departamento?",
      "Como ver la Lista de Departamentos?",
      "Como registrar una Localidad?",
      "Como ver la Lista de Localidades?",
      "Como cambiar Datos de la Empresa?",
      "Como ver Datos Actuales de la Empresa?",
      "Como registrar Funcionario?",
      "Como ver la Lista de Funcionarios?",
      "Como registrar un Usuario?",
      "Como ver la Lista de Usuarios?",
      "Como ver el log de Auditoria?"
    ]
    @link_helps=[
      "Completar los campos de Usuario y contrasena",
      "Ir al Menu,Cliente, Clikc en Nuevo Cliente. Aqui debes completar todos los datos requeridos del cliente, si no se encuentra registrada su Localidad tenes la opcion de crear una Nueva Localidad desde aca, una vez completo haz click en Guardar, esto te redirecciona a una tabla donde te muestra todos los datos del Nuevo Cliente en donde tenes la opcion de editar o borrar los datos del mismo si fuera necesario.Tambien desde aca tenes la opcion de Crear un Nuevo Cliente o ir a la Lista Completa de Clientes. Si haces click en Cancelar te llevara a la Lista Completa de Clientes registrados en la Empresa. Para realizar dicha accion de registrar debes ser un Administrativo o Empleado de la Empresa.",
      "Ir al Menu,Cliente, Clikc en Lista de Clientes. Aqui muestra todos los datos de los Clientes registrados en la Empresa, teniendo la opcion de editar o borrar datos de uno o mas clientes si fuera necesario. Tambien desde aca tenes la opcion de Crear un Nuevo Cliente o de Ver la Lista Completa en formato PDF,pudiendo descargarlo, o imprimir desde la web si lo desea. Para realizar dicha accion de ver o imprimr debes ser un Administrativo o Empleado de la Empresa.",
      "Ir al Menu,Facturacion, Clikc en Nueva Factura. Aqui debes completar todos los datos requeridos para la facturacion, una vez compelto haz click en Guardar. Para realizar dicha accion de registrar debes ser un Administrativo o Empleado de la Empresa.  ",
      "Ir al Menu,Facturacion, Clikc en Lista de Facturas. Para realizar dicha accion de ver o imprimir debes ser un Administrativo o Empleado de la Empresa.  ",
      "Ir al Menu,Producto, Clikc en Nuevo Producto. Aqui debes completar todos los datos requeridos del producto, una vez completo haz click en Guardar, esto te redirecciona a una tabla donde te muestra todos los datos de Nuevo Producto en donde tenes la opcion de editar o borrar los datos del mismo si fuera necesario. Tambien desde aca tenes la opcion de Crear un Nuevo Producto o ir a la Lista Completa de Productos.Si haces click en Cancelar te llevara a la Lista Completa de Productos registrados en la Empresa. Para realizar dicha accion de registrar debes ser un Administrativo o Empleado de la Empresa.",
      "Ir al Menu,Producto, Clikc en Lista de Productos. Aqui muestra todos los datos de los Productos registrados en la Empresa, teniendo la opcion de editar o borrar los datos de uno mas productos si fuera necesario. Tambien desde aca tenes la opcion de Crear un Nuevo Producto o de Ver la Lista Completa en formato PDF,pudiendo descargarlo, o imprimir desde la web si lo desea. Para realizar dicha accion de ver o imprimir debes ser un Administrativo o Empleado de la Empresa.",
      "Ir al Menu,Localidad, Clikc en Nueva Localidad. Aqui debes completar todos los datos requeridos de la localidad, si no se encuentra registrado el Departamento al que pertenece tenes la opcion de crear un Nuevo Departamento desde aca,una vez completo haz click en Guardar, esto te redirecciona a una tabla donde te muestra todos los datos de la Nueva Localidad en donde tenes la opcion de editar o borrar los datos del mismo si fuera necesario. Tambien desde aca tenes la opcion de Crear una Nueva Localidad o ir a la Lista Completa de Localidades.Si haces click en Cancelar te llevara a la Lista Completa de Localidades registradas en la Empresa. Para realizar dicha accion de registrar debes ser un Administrativo o Empleado de la Empresa.",
      "Ir al Menu,Localidad, Clikc en Lista de Localidades. Aqui muestra todos los datos de las Localidades registradas en la Empresa, teniendo la opcion de editar o borrar datos de una o mas Localidades si fuera necesario. Tambien desde aca tenes la opcion de Crear una Nueva Localidad. Para realizar dicha accion de ver debes ser un Administrativo o Empleado de la Empresa.",
      "Ir al Menu,Departamento, Clikc en Nuevo Departamento. Aqui debes completar todos los datos requerido del departamento, una vez completo haz click en Guardar, esto te redirecciona a una tabla donde te muestra todos los datos de Nuevo Departamento en donde tenes la opcion de editar o borrar los datos del mismo si fuera necesario. Tambien desde aca tenes la opcion de Crear un Nuevo Departamento o ir a la Lista Completa de Departamentos.Si haces click en Cancelar te llevara a la Lista Completa de Departamentos registrados en la Empresa. Para realizar dicha accion de registrar debes ser un Administrativo o Empleado de la Empresa.",
      "Ir al Menu,Departamento, Clikc en Lista de Departamentos. Aqui muestra todos los datos de los Departamentos registrados en la Empresa, teniendo la opcion de editar o borrar los datos de uno mas departamento si fuera necesario. Tambien desde aca tenes la opcion de Crear un Nuevo Departamento. Para realizar dicha accion de ver debes ser un Administrativo o Empleado de la Empresa.",
      "Ir al Menu,Configuracion del Sistema, Datos de la Empresa, Clikc en Nuevo Dato. Aqui debes completar todos los datos requerido de la Empresa, una vez completo haz click en Guardar, esto te redirecciona a una tabla donde te muestra todos los Nuevos Datos en donde tenes la opcion de editar o borrar los datos del mismo si fuera necesario. Tambien desde aca tenes la opcion de Crear un Nuevo Dato para la Empresa. Si haces click en Cancelar te llevara a Ver los Datos Actuales registrados en la Empresa.Para realizar dicha accion de registrar debes ser un Administrativo de la Empresa.",
      "Ir al Menu,Configuracion del Sistema, Datos de la Empresa, Clikc en Ver Datos. Aqui muestra todos los Datos registrados de la Empresa, teniendo la opcion de editar o borrar si fuera necesario. Tambien desde aca tenes la opcion de Crear un Nuevo Dato para la Empresa. Para realizar dicha accion de ver debes ser un Administrativo de la Empresa.",
      "Ir al Menu,Configuracion del Sistema, Usuario, Click en Nuevo Usuario. Aqui debes completar todos los datos requeridos del usuario, si no se encuentra registrado el Funcionario al corresponde tenes la opcion de crear un Nuevo Funcionario desde aca,una vez completo haz click en Guardar, esto te redirecciona a una tabla donde te muestra todos los datos del Nuevo Usuario en donde tenes la opcion de editar o borrar los datos del mismo si fuera necesario. Tambien desde aca tenes la opcion de Crear un Nuevo Usuario o ir a la Lista Completa de Usuarios.Si haces click en Cancelar te llevara a la Lista Completa de Usuarios registradas en la Empresa. Para realizar dicha accion de registrar debes ser un Administrativo de la Empresa.",
      "Ir al Menu,Configuracion del Sistema, Usuario, Clikc en Lista de Usuarios. Aqui muestra todos los datos de los Usuarios registrados en la Empresa, teniendo la opcion de editar o borrar datos de uno o mas Usuarios si fuera necesario. Tambien desde aca tenes la opcion de Crear un Nuevo Usuario. Para realizar dicha accion de ver debes ser un Administrativo de la Empresa.",
      "Ir al Menu,Configuracion del Sistema, Funcionario, Click en Nuevo Funcionario. Aqui debes completar todos los datos requeridos del funcionario, si no se encuentra registrado la Localidad al corresponde tenes la opcion de crear una Nueva Localidad desde aca,una vez completo haz click en Guardar, esto te redirecciona a una tabla donde te muestra todos los datos del Nuevo Funcionario en donde tenes la opcion de editar o borrar los datos del mismo si fuera necesario. Tambien desde aca tenes la opcion de Crear un Nuevo Funcionario o ir a la Lista Completa de Funcionarios.Si haces click en Cancelar te llevara a la Lista Completa de Funcionarios registradas en la Empresa. Para realizar dicha accion de registrar debes ser un Administrativo de la Empresa.",
      "Ir al Menu,Configuracion del Sistema, Funcionario, Clikc en Lista de Funcionarios. Aqui muestra todos los datos de los Funcionarios registrados en la Empresa, teniendo la opcion de editar o borrar datos de uno o mas Funcionarios si fueranecesario. Tambien desde aca tenes la opcion de Crear un Nuevo Funcionario. Para realizar dicha accion de ver debes ser un Administrativo de la Empresa.",
      "Ir al Menu,Configuracion del Sistema, Auditoria, Click en Detalle de Auditoria. Aqui muestra puede ver el Log completo de Auditoria: con fecha, hora, actividad realizada y el usuario responsable. Para realizar dicha accion de ver debes ser un Administrativo de la Empresa.  ",
    ]
  end
  
end