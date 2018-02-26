module ExceptionHandler
  class ExceptionController < ApplicationController

    #Response
    #http://www.justinweiss.com/articles/respond-to-without-all-the-pain/
    respond_to :html, :xml, :json

    #Layout
    layout :layout

    #Helpers
    helper ExceptionHandler::Engine.helpers      #-> HELPERS http://stackoverflow.com/questions/9809787/why-is-my-rails-mountable-engine-not-loading-helper-methods-correctly
    include Rails.application.routes.url_helpers #-> ROUTES http://stackoverflow.com/a/6074911/1143732

    ####################
    #      Action      #
    ####################

    #Show
    #Amend responses in tests
    #Need to test validity of JSON responses etc
    def show
      puts details[:name].inspect
      case @status
        when 404
          render_404
        when 403
          render_403
        else
          render_500
      end
    end

    ####################
    #   Dependencies   #
    ####################

    protected

    # Status declarations moved to "show" w/ service object
    # Details moved to "View Helper"

    ####################
    #      Layout      #
    ####################

    private

    #Layout
    def layout
      (/^(5[0-9]{2})$/ !~ @exception.code.to_s) ? (ExceptionHandler.config.layouts["400"] || nil) : ExceptionHandler.config.layouts["500"] #-> if not 500, use predefined layout
    end

    ####################

  end
end
