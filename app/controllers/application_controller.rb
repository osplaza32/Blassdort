class ApplicationController < ActionController::Base
  CIPPER = Gibberish::AES.new('Blast Door la lleva')



  def file_logo(entrada)
    "#{Empresa.find(entrada).logo}"
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


end
