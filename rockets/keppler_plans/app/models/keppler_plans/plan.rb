# frozen_string_literal: true

module KepplerPlans
  # Plan Model
  class Plan < ApplicationRecord
    include ActivityHistory
    include CloneRecord
    include Uploadable
    include Downloadable
    include Sortable
    include Searchable
    acts_as_list
    acts_as_paranoid
    
    has_many :accounts, class_name: 'KepplerAccounts::Account'
    def self.index_attributes
      %i[name description type]
    end
  end
end
