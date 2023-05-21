# frozen_string_literal: true

module Mandelbrot
  class Ascii
    def initialize(**args)
      @width = args[:width]
      @generator = Generator.new(**args)
    end

    def render
      @generator.vector.each_slice(@width).map do |row|
        row.map(&method(:code)).join
      end.join("\n")
    end

    private

    def code(value)
      case value
      when 0..2
        ' '
      when 3..5
        '.'
      when 6..10
        '•'
      when 11..30
        '*'
      when 31..100
        '+'
      when 101..200
        'x'
      when 201..400
        '$'
      when 401..700
        '#'
      else
        '%'
      end
    end
  end
end
