module KepplerAccounts
  # Policy for Account model
  class AccountPolicy < ControllerPolicy
    attr_reader :user, :objects

    def initialize(user, objects)
      @user = user
      @objects = objects
    end
  end
end