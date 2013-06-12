class SesionesController < ApplicationController

    def new
      flash[:error] = ""
    end
   
    def create
       user = login(params[:inputUsername], params[:inputPassword], params[:remember_me])
       respond_to do |format|
        if user
          format.html{ redirect_back_or_to(paginas_estaticas_path, message: "Login Exitoso"); }
          format.js { render 'redireccionar'}
        else
          flash[:error] = "Usuario o contrase&ntildea"
           format.js { render 'mostrar_div' }
        end
      end
    end

  def destroy
      logout
     redirect_back_or_to(root_path,message:"Logout");
  end
end
