require 'spec_helper'

describe Tower do

  before(:each) do
    @tower = Tower.new
    @tower.setup(3, 10)
  end

  describe "#closest_elevator" do
    it "should return and elevator" do
      @tower.seed
      p @tower
      @tower.seed
      p @tower
    end
  end

end
