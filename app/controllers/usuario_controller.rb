class UsuarioController < ApplicationController

  def perfil
    @logocompany = file_logo

  end

  def editar
    @logocompany = file_logo

  end
  def create
    @logocompany = file_logo

  end
  def file_logo
    'blastdoorsinblanco.png'
  end
end
