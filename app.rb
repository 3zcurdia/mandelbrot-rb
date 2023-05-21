# frozen_string_literal: true

require_relative './lib/mandelbrot'

time = Time.now
# Mandelbrot::Pixels.new(width: 200, height: 48).render
puts Mandelbrot::Ascii.new(width: 200, height: 48).render
puts "Elapsed time: #{Time.now - time}"
