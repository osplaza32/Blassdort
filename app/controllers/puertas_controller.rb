class PuertasController < ApplicationController
  before_action :require_login

  def create
    if session.has_key?(:idempresa)

      @logocompany = file_logo(CIPPER.decrypt(session[:idempresa]))
    else
      redirect_to :root

    end
  end

  def create2
    # @logocompany = file_logo(CIPPER.decrypt(session[:idempresa]))
    if session.has_key?(:idempresa)

      hardware = Hardware.find_by_nserial(params[:puerta][:serial])
      if !hardware.nil?
        if Puerta.find_by_hardware_id(hardware.id).nil?
          nuevaPuerta =  Puerta.create(descr:params[:puerta][:desc],empresa_id: CIPPER.decrypt(session[:idempresa]),hardware_id: hardware.id)
          if nuevaPuerta.save
            flash[:notice] = 'La puerta a sido creada con exito'

            redirect_to :controller => 'puertas', :action => 'get'

          else
            flash[:notice] = 'tenemos un problema'
            redirect_to :controller => 'puertas', :action => 'create'

          end

        else
         flash[:notice] = 'la serial esta en uso'
         redirect_to :controller => 'puertas', :action => 'create'


        end

      else
      flash[:notice] = 'revise la serial'
      redirect_to :controller => 'puertas', :action => 'create'

      end
    
    else
      redirect_to :root


    end


  end
  def add
    if session.has_key?(:idempresa)
      @CIPPER = Gibberish::AES.new('Blast Door la lleva')
      @logocompany = file_logo(CIPPER.decrypt(session[:idempresa]))
      @datosusuarios = Empresa.find(CIPPER.decrypt(session[:idempresa])).usuarios
      @horarios1 = Horario.first(12)
      @horarios2 = Horario.limit(12).offset(12)
      @horarios3 = Horario.limit(12).offset(24)
      @horarios4 = Horario.last(12)
      @dias = Dia.all
      idport = Hardware.find_by_nserial(params[:data][:puera]).puerta.id
      @idUsuarios = Permiso.where("puerta_id = ?",idport).distinct.select(:usuario_id).to_a

    else
      redirect_to :root

    end
    



  end
  def delete
    a = Puerta.find_by_id(CIPPER.decrypt(params[:data][:puera]))
    b =Puerta.find_by_id(CIPPER.decrypt(params[:data][:puera])).permisos
    b.destroy
    a.destroy
    if a.destroyed?
      flash[:notice] = 'la Puerta a sido eliminada exitosamente'
      redirect_to :controller => 'puertas', :action => 'get'

    else
      flash[:notice] = 'la Puerta no pudo ser eliminada'
      redirect_to :controller => 'puertas', :action => 'get'

    end

  end

  def get
    if session.has_key?(:idempresa)
      @CIPPER = Gibberish::AES.new('Blast Door la lleva')

      @logocompany = file_logo(CIPPER.decrypt(session[:idempresa]))
      @datospuertas = Empresa.find(CIPPER.decrypt(session[:idempresa])).puertas
    else
      redirect_to :root

    end



  end

  def perfil
    @logocompany = file_logo(CIPPER.decrypt(session[:idempresa]))

  end

  def update
    @CIPPER = Gibberish::AES.new('Blast Door la lleva')

    if Hardware.find_by_nserial(params[:Descriptcion][:Serial].to_s)
      if Hardware.find_by_nserial(params[:Descriptcion][:Serial].to_s).puerta.nil? or Puerta.find_by_id(params[:Descriptcion][:secret]).descr != params[:Descriptcion][:Nombre].to_s
       hidnew = Hardware.find_by_nserial(params[:Descriptcion][:Serial].to_s).id
       newPuerta = Puerta.find_by_id(params[:Descriptcion][:secret])
       newPuerta.update(descr:params[:Descriptcion][:Nombre].to_s,hardware_id:hidnew)
        if newPuerta.valid?
          newPuerta.save
          flash[:notice] = "Cambio realizado"

          redirect_to :controller => 'puertas', :action => 'get'

        else
          flash[:notice] = newuser.errors.messages.map { |k,v| v }.join('<br>').html_safe
          flash[:notice] +=  ' \n no pudimos guardar su cuenta por favor revise sus datos'
          redirect_to :controller => 'puertas', :action => 'get'

        end
      else
        flash[:notice] = "Blastdoor ocupado"
        redirect_to :controller => 'puertas', :action => 'get'

      end
    else
      flash[:notice] = "Blastdoor inexistente"
      redirect_to :controller => 'puertas', :action => 'get'

    end

  end


end
