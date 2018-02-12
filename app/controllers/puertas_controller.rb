class PuertasController < ApplicationController
  def create
    @logocompany = file_logo(CIPPER.decrypt(session[:idempresa]))

  end

  def get
    @logocompany = file_logo(CIPPER.decrypt(session[:idempresa]))
    @datospuertas = Empresa.find(CIPPER.decrypt(session[:idempresa])).puertas


  end

  def perfil
    @logocompany = file_logo(CIPPER.decrypt(session[:idempresa]))

  end


end
