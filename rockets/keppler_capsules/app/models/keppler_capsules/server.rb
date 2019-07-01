# frozen_string_literal: true

module KepplerCapsules
  # Server Model
  class Server < ApplicationRecord
    include ActivityHistory
    include CloneRecord
    include Uploadable
    include Downloadable
    include Sortable
    include Searchable
    acts_as_list
    acts_as_paranoid
    # Begin validations area (don't delete)
    # End validations area (don't delete

    def self.index_attributes
      %i[]
    end
  end
end
