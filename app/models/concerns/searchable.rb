module Searchable
  extend ActiveSupport::Concern
  included do

    def self.search(key, value)
      if self.column_names.include?(key)
        where("#{key} LIKE :value", value: "%#{value}%")
      else
        nil
      end
    end
  end
end
