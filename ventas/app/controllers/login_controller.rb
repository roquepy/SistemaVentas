class LoginController < ApplicationController
  def new
		@usuario = User.new
	end

	def create
		if @usuario = login(params[:username], params[:password])
			redirect_back_or_to(posts_path, message:"Login exitoso")
		else
			flash.now[:alert] = "Algo salio mal con el login"
			render action: :new
		end
	end

	def destroy
		logout
		redirect_to(root_path, message: "Sesion Cerrada")
	end
end