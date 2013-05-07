class ApplicationController < ActionController::Base
    def not_authenticated
    redirect_to login_url, :alert => "Debe de estar logueado"
  end
end
