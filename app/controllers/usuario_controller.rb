class UsuarioController < ApplicationController

  before_action :require_login

  def index
    @logocompany = file_logo(CIPPER.decrypt(session[:idempresa]))
    @idPuertasAllow = Usuario.find_by_id(CIPPER.decrypt(session[:idusuario])).permisos.select(:puerta_id).distinct.to_a
  end
  def comprobar
    comprobacionMaestra(Usuario.find_by_id(CIPPER.decrypt(session[:idusuario])),
                        Puerta.find_by_id(params[:data][:puera]))
  end
  def perfil
    @logocompany = file_logo(CIPPER.decrypt(session[:idempresa]))
  end

  def editar
    @logocompany = file_logo(CIPPER.decrypt(session[:idempresa]))
  end

  def create
    @logocompany = file_logo(CIPPER.decrypt(session[:idempresa]))

  end
  def create3
    @logocompany = file_logo(CIPPER.decrypt(session[:idempresa]))


  end
  def createpincode
    idusuario = CIPPER.decrypt(session[:idusuario])
    Usuario.update(idusuario, :pincode =>params[:signup][:pass_confirm])
    puts Usuario.find_by_id(idusuario).pincode

  end

  def generate_activation_code(size = 7)
    charset = %w[2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z]
    (0...size).map { charset.to_a[rand(charset.size)] }.join
  end
  def create2
    empresa = CIPPER.decrypt(session[:idempresa])
    nombre = params[:usuarios][:nombre]
    apellido = params[:usuarios][:apellido]
    email = params[:usuarios][:email]
    cargo = params[:usuarios][:cargo]
    tel = params[:usuarios][:telefono]
    ntarjeta = params[:usuarios][:tarjeta]

    if Usuario.where("email = ? AND empresa_id = ?", email.to_s, empresa.to_s).blank?
      pass = generate_activation_code
      newuser = Usuario.create(nombre: nombre,ntarjeta: ntarjeta,email:email, apellido: apellido, password: pass, password_confirmation: pass, role: "usuario", empresa_id: empresa, cargo: cargo, telefono: tel)
      if newuser.save
        begin

          flash[:notice] =  'Cuenta guardada'
          UsuarioNotificacionMailer.send_signup_email(newuser,pass).deliver
          redirect_to :controller => 'usuarios', :action => 'get'

        rescue
            redirect_to :controller => 'usuarios', :action => 'get'


        end
      else
        flash[:notice] =  'no pudimos guardar su cuenta por favor revise sus datos'
      end
    else
      flash[:notice] = 'la empresa ya tiene alguien con ese nombre y apellido en el sistema'


    end
  end
end
