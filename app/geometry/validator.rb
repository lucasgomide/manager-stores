# frozen_string_literal: true

module Geometry
  class Validator
    def self.point?(geometry)
      return false unless geometry.is_a?(Array)
      return false if geometry.first.is_a?(Array)
      geometry.count == 2
    end

    def self.multipolygon?(geometry)
      return false unless geometry.is_a?(Array)
      deep(geometry) == 3
    end

    def self.deep(geometry, counter = 0)
      if geometry.count >= 1 && geometry.first.is_a?(Array)
        counter = counter.next
        return deep(geometry.first, counter)
      end
      counter
    end
  end
end
