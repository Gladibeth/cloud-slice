require_dependency "keppler_frontend/application_controller"

module KepplerFrontend
  class App::FrontendController < App::AppController
    include FrontsHelper
    layout 'layouts/keppler_frontend/app/layouts/application'


    def home
      @accounts = rocket('accounts', 'account').all
      @accounts_with_plans = rocket('accounts', 'account').plans
      @plans = rocket('plans', 'plan').all
    end

    def plans
      @plans = rocket('accounts', 'account').plans
    end

    def set_plan
      account = rocket('accounts', 'account').find(params[:account_id])

      if account.update(acccount_params)
        redirect_back(fallback_location: keppler_path)
      else
      end
      
    end

    def account
    end

    def sortable
    end

    private

    def acccount_params
      params.require(:account).permit(:plan_id)
    end

  end
end
