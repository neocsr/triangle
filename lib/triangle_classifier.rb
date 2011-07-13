# TriangleClassifier

require 'bigdecimal'

class TriangleClassifier
  def self.classify(a, b, c)

    a, b, c = self.check_inputs(a, b, c)
    self.check_sides(a, b, c)

    case [a, b, c].uniq.size
      when 1 then :equilateral
      when 2 then :isosceles
      else        :scalene
    end

  end

  private

  def self.check_sides(a, b, c)
    sides = [a, b, c].sort

    if sides.any? { |s| s <= 0 }
      raise ArgumentError
    end

    if sides[0] + sides[1] <= sides[2]
      raise ArgumentError
    end
  end

  def self.check_inputs(a, b, c)
    if [a, b, c].map{|e| e.class}.uniq.size == 1
      [a, b, c]
    else
      [a.to_f, b.to_f, c.to_f]
    end
  end
end