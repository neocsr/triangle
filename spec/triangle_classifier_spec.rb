require File.expand_path(File.dirname(__FILE__) + '/../lib/triangle_classifier.rb')

describe "TriangleClassifier" do

  it "should exist" do
    defined?(TriangleClassifier).should_not be_nil
  end

  context "handling numeric input" do
    it "should convert to one numeric type for all sides" do
      TriangleClassifier.check_inputs(5, 5.0, 5.0).should eql([5.0, 5.0, 5.0])
    end
    it "should use the same values if the numeric type is the same" do
      TriangleClassifier.check_inputs(5, 5, 5).should eql([5, 5, 5])
    end
  end

  context "invalid length sides" do
    it "should raise error when any length is zero or negative" do
      expect{TriangleClassifier.check_sides(0, 5, 5)}.to raise_error(ArgumentError)
    end    
    
    it "should raise error when length of the largest side greater than the sum of the others" do
      expect{TriangleClassifier.check_sides(5, 5, 11)}.to raise_error(ArgumentError)
    end    
  end


  context "valid length sides" do
    it "should detect an equilateral triangle" do
      TriangleClassifier.classify(5, 5, 5).should eql(:equilateral)
    end

    it "should detect an isosceles triangle" do
      TriangleClassifier.classify(1, 5, 5).should eql(:isosceles)
    end

    it "should detect an scalene triangle" do
      TriangleClassifier.classify(3, 7, 5).should eql(:scalene)
    end

    it "should detect an equilateral triangle" do
      TriangleClassifier.classify(5, 5, 5.0).should eql(:equilateral)
    end
  end

end