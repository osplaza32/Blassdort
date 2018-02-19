class MqttSubscriberJob < ApplicationJob

  def run
    Thread.new do

       c =  MQTT::Client.connect(:host => 'localhost')
       h = Hardware.all
       h.each do |a|
         c.subscribe("#{a.nserial}/tarjetas")
       end


       c.get do |topic,message|
         puts "#{topic}: #{message}"

         usu = Usuario.find_by_ntarjeta(message)
         pur = Hardware.find_by_nserial(topic.slice(0..(topic.index('/'))-1)).puerta
         if usu.role == "admin"
           ApplicationController.new.mqttaproved(usu,Hardware.find_by_nserial(topic.slice(0..(topic.index('/'))-1)))


         else
           ApplicationController.new.comprobacionMaestra(usu,pur)
         end

       end
      end
    end
  end
