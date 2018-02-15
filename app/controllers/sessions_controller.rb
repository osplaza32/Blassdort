class SessionsController < ApplicationController
  def new
  end
  def file_logo
    'blastdoorsinblanco.png'
  end
  def auth
   # begin
      @usu = Usuario.find_by_email params[:usuariomail][:email]

      if @usu.authenticate(params[:usuariopass])
        session[:idusuario] = CIPPER.encrypt(@usu.id.to_s)
        session[:idempresa] = CIPPER.encrypt(@usu.empresa_id.to_s)
        case @usu.role
          when "admin"
            redirect_to controller: 'home', action: 'index'

          when "usuario"
            puts "Logre entrar"

            redirect_to controller: 'usuario',action:'index'



        end
      else
        redirect_to :root

      end
   # rescue
      #flash[:notice] = "Esta cuenta no se a encontrado"

      #redirect_to :root
    #end
  end

end
