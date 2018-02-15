class UsuarioController < ApplicationController
  def index
    @logocompany = file_logo(CIPPER.decrypt(session[:idempresa]))


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

    if Usuario.where("email = ? AND empresa_id = ?", email.to_s, empresa.to_s).blank?
      pass = generate_activation_code
      newuser = Usuario.create(nombre: nombre, email:email, apellido: apellido, password: pass, password_confirmation: pass, role: "usuario", empresa_id: empresa, cargo: cargo, telefono: tel)
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
