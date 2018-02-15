class PermisosController < ApplicationController
  def comprobar
    idusuario =   CIPPER.decrypt(session[:idusuario])
    usu = Usuario.find(idusuario)
    serial = params[:data][:puera]
    puerta = Hardware.find_by_nserial(serial).puerta
    if usu.role == 'admin'
      MQTT::Client.connect('localhost',:client_id => usu.email) do |client|

        client.publish(serial, "Abrir")

      end


    else
    end

  end
  def create
    h = Hardware.find_by_nserial(params[:hardward][:nserial]).puerta
    idUsua = CIPPER.decrypt(params[:usuario][:id])
    arrday = params[:d_ids]
    arrh = params[:h_ids]
    arrday.each do |dia|
      arrh.each do |hora|
        Permiso.create(usuario_id:idUsua,puerta_id:h.id,dia_id:dia,horario_id:hora).save
      end
    end


  end
end
