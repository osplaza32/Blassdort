class MetricasController < ApplicationController
  def get
    if session.has_key?(:idempresa)
    @logocompany = file_logo(CIPPER.decrypt(session[:idempresa]))
    else
      redirect_to :root

    end


  end

end
