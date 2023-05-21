# frozen_string_literal: true

module Mandelbrot
  class Generator
    def initialize(width:, height:, max_iterations: 1000, x_min: -2.0, x_max: 1.0, y_min: -1.0, y_max: 1.0)
      @width = width
      @height = height
      @max_iterations = max_iterations
      @x_min = x_min
      @x_max = x_max
      @y_min = y_min
      @y_max = y_max
      @dx = @x_max - @x_min
      @dy = @y_max - @y_min
    end

    def vector
      return @vector if defined?(@vector)

      @vector = []
      @height.times do |y|
        @width.times do |x|
          x_percent = x.to_f / @width
          y_percent = y.to_f / @height
          cx = @x_min + @dx * x_percent
          cy = @y_min + @dy * y_percent
          @vector << mandelbot_point(cx, cy)
        end
      end
      @vector
    end

    private

    def mandelbot_point(cx, cy)
      z = Complex(0.0, 0.0)
      c = Complex(cx, cy)

      @max_iterations.times do |n|
        return n if z.abs > 2

        z = z * z + c
      end

      @max_iterations
    end
  end
end
