
# frozen_string_literal: true

require_dependency "keppler_plans/application_controller"
module KepplerPlans
  module Admin
    # PlansController
    class PlansController < ::Admin::AdminController
      layout 'keppler_plans/admin/layouts/application'
      before_action :set_plan, only: %i[show edit update destroy]
      before_action :index_variables
      include ObjectQuery

      # GET /plans
      def index
        respond_to_formats(@plans)
        redirect_to_index(@objects)
      end

      # GET /plans/1
      def show; end

      # GET /plans/new
      def new
        @plan = Plan.new
      end

      # GET /plans/1/edit
      def edit; end

      # POST /plans
      def create
        @plan = Plan.new(plan_params)

        if @plan.save
          redirect(@plan, params)
        else
          render :new
        end
      end

      # PATCH/PUT /plans/1
      def update
        if @plan.update(plan_params)
          redirect(@plan, params)
        else
          render :edit
        end
      end

      def clone
        @plan = Plan.clone_record params[:plan_id]
        @plan.save
        redirect_to_index(@objects)
      end

      # DELETE /plans/1
      def destroy
        @plan.destroy
        redirect_to_index(@objects)
      end

      def destroy_multiple
        Plan.destroy redefine_ids(params[:multiple_ids])
        redirect_to_index(@objects)
      end

      def upload
        Plan.upload(params[:file])
        redirect_to_index(@objects)
      end

      def reload; end

      def sort
        Plan.sorter(params[:row])
      end

      private

      def index_variables
        @q = Plan.ransack(params[:q])
        @plans = @q.result(distinct: true)
        @objects = @plans.page(@current_page).order(position: :asc)
        @total = @plans.size
        @attributes = Plan.index_attributes
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_plan
        @plan = Plan.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def plan_params
        params.require(:plan).permit(
          :name, :description, :type
        )
      end
    end
  end
end
