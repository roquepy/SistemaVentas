class SesionesController < ApplicationController
   
    def create
       user = login(params[:username], params[:password])
        if user
          redirect_back_or_to root_url, :notice => "login"
        else
          flash.now.alert = "Usuario o contrasena incorrecta"
          render :new
        end
    end

  def destroy
      logout
      redirect_to root_url, :notice => "logout"
  end
end
