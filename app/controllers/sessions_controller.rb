class SessionsController < ApplicationController
  def new
  end
  def file_logo
    'blastdoorsinblanco.png'
  end
  def auth
    @usu = Usuario.find_by_email params[:usuariomail][:email]

    if @usu.authenticate(params[:usuariopass])
      session[:idusuario] = CIPPER.encrypt(@usu.id.to_s)
      session[:idempresa] = CIPPER.encrypt(@usu.empresa_id.to_s)
      case @usu.role
        when "admin"
          redirect_to controller: 'home', action: 'index'

        when "usuario"
          redirect_to "http://localhost/app-blastDoor/"


        else
          redirect_to :root
      end
    else
      redirect_to :root

    end
  end
end
