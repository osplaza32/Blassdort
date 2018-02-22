  class MqttSubscriberJob < ApplicationJob

  def run
    Thread.new do
      puts "quiero ver todo el dia este mesaje"

       c =  MQTT::Client.connect(:host => 'localhost')
       h = Hardware.all
       h.each do |a|
         c.subscribe("#{a.nserial}/tarjetas")
       end


       c.get do |topic,message|
         puts "#{topic}: #{message}"

         usu = Usuario.find_by_ntarjeta(message)
         pur = Hardware.find_by_nserial(topic.slice(0..(topic.index('/'))-1)).puerta
         if usu.empresa_id === pur.empresa_id
          if usu.role == "admin"
            if usu.empresa_id === pur.empresa_id
            ApplicationController.new.mqttaproved(usu,Hardware.find_by_nserial(topic.slice(0..(topic.index('/'))-1)))
            else
              puts "Este usuario admin no puede abrir esta puerta"

            end



          else
           ApplicationController.new.comprobacionMaestra(usu,pur)
          end
         else
           puts "Este usuario  no puede abrir esta puerta"
         end

       end
      end
    end
  end
