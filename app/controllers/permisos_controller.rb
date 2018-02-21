class PermisosController < ApplicationController
  before_action :require_login

  def comprobar
    idusuario =   CIPPER.decrypt(session[:idusuario])
    usu = Usuario.find(idusuario)
    serial = params[:data][:puera]
    ApplicationController.new.mqttaproved(usu,Hardware.find_by_nserial(serial))
    redirect_to :controller => 'puertas', :action => 'get'


  end

  def create
    puerta = Hardware.find_by_nserial(params[:hardward][:nserial]).puerta
    idUsua = CIPPER.decrypt(params[:usuario][:id])
    arrday = params[:d_ids]
    arrh = params[:h_ids]
    Permiso.where('usuario_id = ? and puerta_id = ?',idUsua.to_s,puerta.id.to_s).delete_all

    arrday.each do |dia|
      arrh.each do |hora|
        Permiso.create(usuario_id:idUsua,puerta_id:puerta.id,dia_id:dia,horario_id:hora).save
      end
    end
    flash[:notice] = "Los permisos han sido creado para el usuario #{Usuario.find_by_id(idUsua.to_i).nombre}"
    redirect_to :controller => 'puertas', :action => 'get'



  end
end
