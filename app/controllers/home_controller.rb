# controller  for home
class HomeController < ApplicationController
  def index
    @logocompany = file_logo
    @maintitle = 'Welcome in Inspinia Rails Seed Project'
    @maindesc = 'It is an application skeleton for a typical Ruby on Rails web app. You can use it to quickly bootstrap your webapp projects and dev/prod environment."'
  end


  def file_logo
    'blastdoorsinblanco.png'
  end
end
