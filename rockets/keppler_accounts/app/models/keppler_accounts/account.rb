# frozen_string_literal: true

module KepplerAccounts
  # Account Model
  class Account < ApplicationRecord
    include ActivityHistory
    include CloneRecord
    include Uploadable
    include Downloadable
    include Sortable
    include Searchable
    acts_as_list
    acts_as_paranoid

    belongs_to :plan, class_name: 'KepplerPlans::Plan'
  
    def self.index_attributes
      %i[name email]
    end

    def self.plans
      where.not(plan_id: nil)
    end
  end
end
