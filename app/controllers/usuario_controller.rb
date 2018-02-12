class UsuarioController < ApplicationController

  def perfil
    @logocompany = file_logo(CIPPER.decrypt(session[:idempresa]))

  end

  def editar
    @logocompany = file_logo(CIPPER.decrypt(session[:idempresa]))

  end
  def create
    @logocompany = file_logo(CIPPER.decrypt(session[:idempresa]))

  end

end
