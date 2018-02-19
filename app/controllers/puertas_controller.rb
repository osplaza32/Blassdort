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
    @pa = params[:data][:confirm]
    @horarios1 = Horario.first(12)
    @horarios2 = Horario.limit(12).offset(12)
    @horarios3 = Horario.limit(12).offset(24)
    @horarios4 = Horario.last(12)
    @dias = Dia.all
    else
      redirect_to :root

    end
    



  end
  def delete
    a = Puerta.find(CIPPER.decrypt(params[:data][:puera]))
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
    puts "#{params}"

  end


end
