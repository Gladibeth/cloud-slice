module KepplerPlans
  # Policy for Plan model
  class PlanPolicy < ControllerPolicy
    attr_reader :user, :objects

    def initialize(user, objects)
      @user = user
      @objects = objects
    end
  end
end