class ApplicationController < ActionController::Base
  before_action :onLIstener
  def onLIstener
    mqttSub = MqttSubscriberJob.new
    mqttSub.run
  end

  CIPPER = Gibberish::AES.new('Blast Door la lleva')
  def comprobacionMaestra(usuario,puerta)
    day = Time.now.strftime("%A")
    horaActual = Time.now.strftime('%H:%M')
    id_day = getidday(day)
    permisosParaHoy =Permiso.where(usuario_id: usuario.id,puerta_id:puerta.id,dia_id:id_day).select(:horario_id).to_a
    if !permisosParaHoy.blank?
      permisosParaHoy.each do |idhoras|
        rango = Horario.find(idhoras.horario_id)
        h1 = rango.inicio.to_time
        h2 = rango.fin.to_time
        if horaActual.between?(h1, h2)
          mqttaproved(usuario,Hardware.find(puerta.hardware_id))
          break
        end
      end
    else
      puts "mANDALE UN ALERT AL DELICUENTE"
    end
  end
  def mqttaproved(usuario,puerta)

    h = Hardware.find(puerta.hardware_id)
    if usuario.empresa_id === puerta.empresa_id

      MQTT::Client.connect('localhost') do |client|
      client.publish(h.nserial,'A')
      Metrica.create(usuario:usuario.id,puerta:puerta.id).save
      end
    else
      puts "No lo mandes ctm"
    end

  end
  def getidday(entrada)
    Dia.find_by_nombre(entrada).id

  end


  def file_logo(entrada)
    "#{Empresa.find(entrada).logo}"
  end
  private
  def require_login
    unless session.has_key?(:idempresa)
      flash[:error] = "You must be logged in to access this section"
      redirect_to :root # halts request cycle
      end
  end


  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


end
