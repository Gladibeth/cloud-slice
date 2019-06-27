
# frozen_string_literal: true

require_dependency "keppler_accounts/application_controller"
module KepplerAccounts
  module Admin
    # AccountsController
    class AccountsController < ::Admin::AdminController
      layout 'keppler_accounts/admin/layouts/application'
      before_action :set_account, only: %i[show edit update destroy]
      before_action :index_variables
      include ObjectQuery

      # GET /accounts
      def index
        respond_to_formats(@accounts)
        redirect_to_index(@objects)
      end

      # GET /accounts/1
      def show; end

      # GET /accounts/new
      def new
        @account = Account.new
      end

      # GET /accounts/1/edit
      def edit; end

      # POST /accounts
      def create
        @account = Account.new(account_params)

        if @account.save
          redirect(@account, params)
        else
          render :new
        end
      end

      # PATCH/PUT /accounts/1
      def update
        if @account.update(account_params)
          redirect(@account, params)
        else
          render :edit
        end
      end

      def clone
        @account = Account.clone_record params[:account_id]
        @account.save
        redirect_to_index(@objects)
      end

      # DELETE /accounts/1
      def destroy
        @account.destroy
        redirect_to_index(@objects)
      end

      def destroy_multiple
        Account.destroy redefine_ids(params[:multiple_ids])
        redirect_to_index(@objects)
      end

      def upload
        Account.upload(params[:file])
        redirect_to_index(@objects)
      end

      def reload; end

      def sort
        Account.sorter(params[:row])
      end

      private

      def index_variables
        @q = Account.ransack(params[:q])
        @accounts = @q.result(distinct: true)
        @objects = @accounts.page(@current_page).order(position: :asc)
        @total = @accounts.size
        @attributes = Account.index_attributes
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_account
        @account = Account.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def account_params
        params.require(:account).permit(
          :name, :date, :email
        )
      end
    end
  end
end
