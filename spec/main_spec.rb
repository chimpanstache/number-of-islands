require 'rspec'
require 'main'

RSpec.describe NumOfIslands do

  describe '#surround_by_water' do
    subject { NumOfIslands.new }

    it 'surrounds the grid by 0s' do
      grid = build_grid_randomly
      subject.surround_by_water(grid)
      expect(grid.first.uniq.first).to eq '0'
      expect(grid.last.uniq.first).to eq '0'
      grid.each do |row|
        expect(row.first).to eq '0'
        expect(row.last).to eq '0'
      end
    end
  end

  def build_grid_randomly
    grid = []
    length = rand(10)

    rand(10).times do
      grid << Array.new(length) { rand(2) }
    end
    grid
  end
end
