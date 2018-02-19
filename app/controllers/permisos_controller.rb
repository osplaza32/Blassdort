class PermisosController < ApplicationController
  before_action :require_login

  def comprobar
    idusuario =   CIPPER.decrypt(session[:idusuario])
    usu = Usuario.find(idusuario)
    serial = params[:data][:puera]
    puerta = Hardware.find_by_nserial(serial).puerta
    MQTT::Client.connect('localhost') do |client|
      client.publish(serial, 'Abrir')
      Metrica.create(usuario:usu.id,puerta:puerta.id,momento: Time.now.strftime('%H:%M %D'))

    end
  end

  def create
    puerta = Hardware.find_by_nserial(params[:hardward][:nserial]).puerta
    idUsua = CIPPER.decrypt(params[:usuario][:id])
    arrday = params[:d_ids]
    arrh = params[:h_ids]
    arrday.each do |dia|
      arrh.each do |hora|
        Permiso.create(usuario_id:idUsua,puerta_id:puerta.id,dia_id:dia,horario_id:hora).save
      end
    end


  end
end
