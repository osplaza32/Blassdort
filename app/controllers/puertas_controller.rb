class PuertasController < ApplicationController
  def create
    @logocompany = file_logo(CIPPER.decrypt(session[:idempresa]))

  end
  def create2
    @logocompany = file_logo(CIPPER.decrypt(session[:idempresa]))

  end
  def add
    @logocompany = file_logo(CIPPER.decrypt(session[:idempresa]))
    @datosusuarios = Empresa.find(CIPPER.decrypt(session[:idempresa])).usuarios
    @pa = params[:data][:confirm]
    @horarios1 = Horario.first(12)
    @horarios2 = Horario.limit(12).offset(12)
    @horarios3 = Horario.limit(12).offset(24)
    @horarios4 = Horario.last(12)
    @dias = Dium.all



  end

  def get
    @logocompany = file_logo(CIPPER.decrypt(session[:idempresa]))
    @datospuertas = Empresa.find(CIPPER.decrypt(session[:idempresa])).puertas


  end

  def perfil
    @logocompany = file_logo(CIPPER.decrypt(session[:idempresa]))

  end

  def update
    puts "#{params}"

  end


end
