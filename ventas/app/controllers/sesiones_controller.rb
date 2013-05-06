class SesionesController < ApplicationController
    def create
       user = login(params[:nombre], params[:clave])
        if user
          redirect_back_or_to root_url, :notice => "Logged in!"
        else
          flash.now.alert = "El password es incorrecto"
          render :new
        end
    end

  def destroy
      logout
      redirect_to root_url, :notice => "Logged out!"
  end
end
