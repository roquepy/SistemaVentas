#Clase requerida para obtener la Auditoria del ABM
require 'custom_logger'

class UsersController < ApplicationController
    #before_filter :require_login

  def index
    @users =User.paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def new
    @user = User.new
    @roles= Rol.find(:all)
    funcionario_new
  end



 # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    funcionario_new
     respond_to do |format|
        if @user.save
          @rol_usuario=RolUsuario.new(:id_usuario=>@user.id,:id_rol=>params[:id_rol])
          @rol_usuario.save
          format.html { redirect_to @user, notice: 'Los datos del  usuario se han creado correctamente.' }
          CustomLogger.info("Se ha creado un nuevo Usuario. Datos: Usuario:#{@user.username.inspect},Nueva Contrasena pertenecientes al Funcionario:#{@user.funcionario.nombres.inspect} .Usuario Responsable:#{current_user.funcionario.full_name.inspect}. Fecha y Hora: #{Time.now}")
          format.json { render json: @user, status: :created, location: @user }
          format.js   {}
        else
          format.html { render action: "new" }
          CustomLogger.error("Error al intentar Crear un Nuevo Usuario. Usuario Responsable:#{current_user.funcionario.full_name.inspect}. Fecha y Hora: #{Time.now}")
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
       end
   end

  def edit
    @user = User.find(params[:id])
    funcionario_new
  end

  def update
    @user = User.find(params[:id])
    funcionario_new
    usuario_antiguo= @user.username
    funcionario_antiguo= @user.funcionario.nombres
      if @user.update_attributes(params[:user])
          @rol_usuario=RolUsuario.find(:first,:conditions=>['id_usuario = ? ',@user.id])
          @rol_usuario=RolUsuario.find(@rol_usuario.id)
          @rol_usuario.update_attributes(:id_usuario=>@user.id,:id_rol=>2)
           usuario_nuevo= @user.username
           funcionario_nuevo= @user.funcionario.nombres
           CustomLogger.info("Datos antes de realizar la Actualizacion del Usuario: Usuario: #{usuario_antiguo.inspect}, Contrasena Original y Funcionario:#{funcionario_antiguo.inspect}.Usuario Responsable: #{current_user.funcionario.full_name.inspect}.Nuevos Datos: Usuario:#{usuario_nuevo.inspect}, Contrasena Nueva y Funcionario:#{funcionario_nuevo.inspect}. Fecha y Hora: #{Time.now}")
           flash[:success] = "Profile updated"
           redirect_to @user
    else
        CustomLogger.error("Error al intentar realizar actualizacion de los siguientes datos del Usuario: #{usuario_antiguo.inspect}, Contrasena Original y Funcionario:#{funcionario_antiguo.inspect}. Usuario Responsable: #{current_user.funcionario.full_name.inspect}. Fecha y Hora: #{Time.now}")
        render action: "edit" 
    end
  end

  def show
    @user = User.find(params[:id])
  end
  
  #DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    begin
    @user.destroy
    notice= "Los datos del Usuario han sido eliminados"
    CustomLogger.info("Han sido eliminado los siguientes datos del Usuario: Usuario:#{@user.username.inspect},Contrasena, pertenecientes al Funcionario:#{@user.funcionario.nombres.inspect} . Usuario Responsable: #{current_user.funcionario.full_name.inspect} , Fecha y Hora: #{Time.now}")
    rescue
    notice= "Los datos del Usuario no se pueden eliminar"
    CustomLogger.error("Error al intentar eliminar los siguientes datos del Usuario: Usuario:#{@user.username.inspect},Contrasena, pertenecientes al Funcionario:#{@user.funcionario.nombres.inspect} . Usuario Responsable: #{current_user.funcionario.full_name.inspect} , Fecha y Hora: #{Time.now}")
    ensure
      respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end

   def funcionario_new
      @funcionario = Funcionario.new
      @localidades=Localidad.all
      @funciones=Funcion.all
      @estados_funcionarios=EstadosFuncionario.all
  end
  def funcionario_create
      @funcionario = Funcionario.new(params[:funcionario])
      @localidades=Localidad.all
      @funciones=Funcion.all
      @estados_funcionarios=EstadosFuncionario.all
      if @funcionario.save
        flash[:notice] = "Se ha guardado el funcionario"
      else
        flash[:notice] = "Hubo Problemas, no guardo"
      end
  end

end
