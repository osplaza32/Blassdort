class SessionsController < ApplicationController
  def new

    unless session[:idusuario].blank?
      if Usuario.find_by_id(CIPPER.decrypt(session[:idusuario])).role === "admin"
        redirect_to controller: 'metricas', action: 'get'
      else
        redirect_to controller: 'usuario',action: if Usuario.find_by_id(CIPPER.decrypt(session[:idusuario])).pincode.blank? then 'create3' else 'pincode' end
      end


    end
  end
  def file_logo
    'blastdoorsinblanco.png'
  end
  def delete
    session.clear
    reset_session
    cookies.to_h.each_pair do |k, v|
      cookies[k.to_sym] = { :value => '',
                            :path => '/',
                            :domain => '.domain.com',
                            :expire => 1.day.ago }
    end

    redirect_to :root

  end
  def auth
   begin
       email = params[:usuariomail][:email].to_s
       clave =params[:usuariopass].to_s
       puts clave
      usu = Usuario.find_by_email(email)
       if usu.authenticate(clave)
        puts "autentica?"
        session[:idusuario] = CIPPER.encrypt(usu.id.to_s)
        session[:idempresa] = CIPPER.encrypt(usu.empresa_id.to_s)
        case usu.role
          when "admin"
            redirect_to controller: 'metricas', action: 'get'

          when "usuario"

            redirect_to controller: 'usuario',action: if usu.pincode.blank? then 'create3' else 'pincode' end



        end
      else
        redirect_to :root

      end
   rescue
      flash[:notice] = "Esta cuenta no se a encontrado"

      redirect_to :root
    end
  end

end
