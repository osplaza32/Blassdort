class UsuariosController < ApplicationController
  before_action :require_login

  def create
  end

  def get
    @CIPPER = Gibberish::AES.new('Blast Door la lleva')


    @logocompany = file_logo(CIPPER.decrypt(session[:idempresa]))
    @datosusuario = Empresa.find(CIPPER.decrypt(session[:idempresa])).usuarios


  end


end
