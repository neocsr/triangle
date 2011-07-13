# TriangleClassifier

class TriangleClassifier
  def self.classify(a, b, c)

    @@sides = [a, b, c]

    @@sides = self.check_inputs(@@sides)
    self.check_sides(@@sides)

    case @@sides.uniq.size
      when 1 then :equilateral
      when 2 then :isosceles
      else        :scalene
    end

  end

  private

  def self.check_sides(sides)
    sides = sides.sort

    if sides.any? { |s| s <= 0 }
      raise ArgumentError
    end

    if sides[0] + sides[1] <= sides[2]
      raise ArgumentError
    end
  end

  def self.check_inputs(sides)
    if sides.map{|e| e.class}.uniq.size == 1
      sides
    else
      sides.map{|e| e.to_f}
    end
  end
end