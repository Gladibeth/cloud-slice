require_dependency "keppler_frontend/application_controller"

module KepplerFrontend
  class App::FrontendController < App::AppController
    include FrontsHelper
    layout 'layouts/keppler_frontend/app/layouts/application'


    def home
      @accounts = rocket('accounts', 'account').all
      @plans = rocket('accounts', 'account').plans
    end

    def plans
      @plans = rocket('accounts', 'account').plans
    end

    def account
    
    end

    def sortable
    
    end

  end
end
