# frozen_string_literal: true

require_dependency "keppler_capsules/application_controller"
module KepplerCapsules
  module Admin
    # ServersController
    class ServersController < ::Admin::AdminController
      layout 'keppler_capsules/admin/layouts/application'
      before_action :set_server, only: %i[show edit update destroy]
      before_action :index_variables
      before_action :set_capsule
      include ObjectQuery

      # GET /servers
      def index
        respond_to_formats(@servers)
        redirect_to_index(@objects)
      end

      # GET /servers/1
      def show; end

      # GET /servers/new
      def new
        @server = Server.new
      end

      # GET /servers/1/edit
      def edit; end

      # POST /servers
      def create
        @server = Server.new(server_params)

        if @server.save
          redirect(@server, params)
        else
          render :new
        end
      end

      # PATCH/PUT /servers/1
      def update
        if @server.update(server_params)
          redirect(@server, params)
        else
          render :edit
        end
      end

      def clone
        @server = Server.clone_record params[:server_id]
        @server.save
        redirect_to_index(@objects)
      end

      # DELETE /servers/1
      def destroy
        @server.destroy
        redirect_to_index(@objects)
      end

      def destroy_multiple
        Server.destroy redefine_ids(params[:multiple_ids])
        redirect_to_index(@objects)
      end

      def upload
        Server.upload(params[:file])
        redirect_to_index(@objects)
      end

      def reload; end

      def sort
        Server.sorter(params[:row])
      end

      private

      def set_capsule
        @capsule = Capsule.find_by_name('servers')
      end

      def index_variables
        @q = Server.ransack(params[:q])
        @servers = @q.result(distinct: true)
        @objects = @servers.page(@current_page).order(position: :desc)
        @total = @servers.size
        @attributes = Server.index_attributes
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_server
        @server = Server.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def server_params
        params.require(:server).permit(
          :name, :position, :deleted_at
        )
      end
    end
  end
end
