# frozen_string_literal: true

module Mandelbrot
  class Pixels
    def initialize(**args)
      @generator = Generator.new(**args)
    end

    def render
      @generator.vector.flat_map(&method(:color))
    end

    private

    def color(value)
      case value
      when 0..5
        [236, 110, 65, 255]
      when 6..10
        [236, 110, 65, 255]
      when 11..30
        [233, 73, 52, 255]
      when 31..100
        [223, 60, 57, 255]
      when 101..200
        [202, 60, 81, 255]
      when 201..400
        [184, 61, 102, 255]
      when 401..700
        [160, 61, 130, 255]
      else
        [124, 62, 171, 255]
      end
    end
  end
end
