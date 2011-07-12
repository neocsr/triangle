# TriangleClassifier

class TriangleClassifier
  def self.classify(a, b, c)

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
end