class SesionesController < ApplicationController
   
    def create
       user = login(params[:username], params[:password])
        if user
          redirect_back_or_to(paginas_estaticas_path,message:"Login Exitoso");
        else
           flash.now[:error]= "Usuario o contrasena incorrecta";
           render :new
        end
    end

  def destroy
      logout
     redirect_back_or_to(root_path,message:"Logout");
  end
end
