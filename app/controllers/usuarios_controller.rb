class UsuariosController < ApplicationController
  before_action :require_login

  def create
  end

  def get
    @logocompany = file_logo(CIPPER.decrypt(session[:idempresa]))
    @datosusuario = Empresa.find(CIPPER.decrypt(session[:idempresa])).usuarios


  end

end
