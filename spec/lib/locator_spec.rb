require 'spec_helper'

describe Locator do

  before(:each) do
    @locator = Locator.new
  end

  describe "#closest_elevator" do
    it "should return and elevator" do
      expect(@locator.closest_elevator(1, [4,2,3])).to eq(1)
      expect(@locator.closest_elevator(1, [2,5,3])).to eq(0)
      expect(@locator.closest_elevator(1, [4,2,1])).to eq(2)
    end
  end

end
