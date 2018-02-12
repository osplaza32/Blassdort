class MetricasController < ApplicationController
  def get
    @logocompany = file_logo(CIPPER.decrypt(session[:idempresa]))


  end

end
