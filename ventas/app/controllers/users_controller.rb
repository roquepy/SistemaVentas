#Clase requerida para obtener la Auditoria del ABM
require 'custom_logger'

class UsersController < ApplicationController
    before_filter :require_login
  def index
    @users =User.paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
  def new
    @user = User.new
    funcionario_new
  end

  def create
    @user = User.new(params[:user])
    funcionario_new
     respond_to do |format|
        if @user.save
          format.html { redirect_to @user, notice: 'El usuario se ha creado correctamente.' }
          format.json { render json: @user, status: :created, location: @user }
          format.js   {}
        else
           format.html { render action: "new" }
        end
       end
   end
  def edit
    @user = User.find(params[:id])
    funcionario_new
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      #sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
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
