class SesionesController < ApplicationController
   def new
    @user = User.new
  end
    def create
       @user = login(params[:nombre], params[:clave])
        if @user
          redirect_back_or_to root_url, :notice => "Login"
        else
          flash.now.alert = "Usuario o clave incorrecta"
          render :new
        end
    end

  def destroy
      logout
      redirect_to root_url, :notice => "logout"
  end
end
