class UsersController < ApplicationController
  def index
    @users =User.buscar(params[:buscar],params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
  def new
    @user = User.new
    @funcionarios=Funcionario.all
  end

  def create
    @user = User.new(params[:user])
    @funcionarios=Funcionario.all
     respond_to do |format|
        if @user.save
          format.html { redirect_to @user, notice: 'El usuario se ha creado correctamente.' }
          format.json { render json: @user, status: :created, location: @user }
        else
           format.html { render action: "new" }
        end
       end
   end
  def edit
    @user = User.find(params[:id])
    @funcionarios=Funcionario.all
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
end
