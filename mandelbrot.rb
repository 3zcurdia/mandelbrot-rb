module Mandelbrot
  module_function

  def run
    mandelbot = calculate(1000, -2.0, 1.0, -1.0, 1.0, 100, 24)

    mandelbot.each do |row|
      line = ""
      row.each do |col|
        line << ascii_value(col)
      end
      puts line
    end
  end

  def calculate(max_iterations, x_min, x_max, y_min, y_max, width, height)
    mandelbot = Array.new(height) { Array.new(width) }
    height.times do |y|
      width.times do |x|
        x_percent = x.to_f / width.to_f
        y_percent = y.to_f / height.to_f
        cx = x_min + (x_max - x_min) * x_percent
        cy = y_min + (y_max - y_min) * y_percent
        mandelbot[y][x] = mandelbot_point(cx, cy, max_iterations)
      end
    end
    mandelbot
  end

  def mandelbot_point(cx, cy, max_iterations)
    z = Complex(0, 0)
    c = Complex(cx, cy)

    max_iterations.times do |n|
      if z.abs > 2
        return n
      end
      z = z * z + c
    end

    max_iterations
  end

  def ascii_value(col)
    case col
    when 0..2
      " "
    when 3..5
      "."
    when 6..10
      "•"
    when 11..30
      "*"
    when 31..100
      "+"
    when 101..200
      "x"
    when 201..400
      "$"
    when 401..700
      "#"
    else
      "%"
    end
  end
end
