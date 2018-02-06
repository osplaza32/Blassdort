class PuertasController < ApplicationController
  def create
    @logocompany = file_logo

  end

  def get
    @logocompany = file_logo

  end

  def perfil
    @logocompany = file_logo

  end
  def file_logo
    'blastdoorsinblanco.png'
  end
end
