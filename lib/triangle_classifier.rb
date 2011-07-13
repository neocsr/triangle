# TriangleClassifier

class TriangleClassifier
  def self.classify(a, b, c)

    @@sides = [a, b, c]

    self.normalize_inputs
    self.check_sides

    case @@sides.uniq.size
      when 1 then :equilateral
      when 2 then :isosceles
      else        :scalene
    end

  end

  private

  def self.check_sides
    if @@sides.any? { |s| s <= 0 }
      raise ArgumentError
    end

    @@sides.sort!
    if @@sides[0] + @@sides[1] <= @@sides[2]
      raise ArgumentError
    end
  end

  def self.normalize_inputs
    if @@sides.map{|e| e.class}.uniq.size != 1
      @@sides.map!{|e| e.to_f}
    end
  end
end