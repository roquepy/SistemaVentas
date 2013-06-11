class SesionesController < ApplicationController

    def new
      flash[:error] = ""
    end
   
    def create
       user = login(params[:inputUsername], params[:inputPassword], params[:remember_me])
        if user
          redirect_back_or_to(paginas_estaticas_path, message: "Login Exitoso");
        else
           flash[:error] = "Usuario o contrasena incorrecta";
           render :new
        end
    end

  def destroy
      logout
     redirect_back_or_to(root_path,message:"Logout");
  end
end
