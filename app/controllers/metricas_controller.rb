class MetricasController < ApplicationController
  def get
    @logocompany = file_logo

  end
  def file_logo
    'blastdoorsinblanco.png'
  end
end
