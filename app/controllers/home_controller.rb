# controller  for home
class HomeController < ApplicationController
  def index
    if session.has_key?(:idempresa)
      @logocompany = file_logo(CIPPER.decrypt(session[:idempresa]))
      @maintitle = 'Hola Usuario poner nombre'
      @maindesc = 'nose que es esto pero enjoy'
    else
      redirect_to :root

    end
  end


end
