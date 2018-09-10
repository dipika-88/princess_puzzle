# frozen_string_literal: true

require 'spec_helper'
describe 'Display path to the princess' do
  before :each do
    @grid_size = 5
    @grid = [['-', '-', '-', '-', '_'],
             ['-', '-', '-', '-', '-'],
             ['-', '-', 'm', '-', '-'],
             ['-', '-', '-', '-', '-'],
             ['p', '-', '-', '-', '-']]
  end
  it 'only odd number should be accepted for grid size' do
    is_even_number = @grid_size.odd?
    expect(is_even_number).to eql true
  end
  it 'grid size should be greater than and equal to 3 or less than 100' do
    number = true if @grid_size >= 3 || @grid_size < 100
    expect(number).to eql true
  end
  it 'bot position should be in the center of the grid' do
    grid_center = @grid_size / 2
    expect(@grid[grid_center][grid_center]).to eql 'm'
    expect(@grid[grid_center][grid_center]).not_to be_empty
  end
  it 'to confirm the postion of princess, it should be in the corners of the grid' do
    corners = []
    corners << [0, 0]
    corners << [0, @grid_size - 1]
    corners << [@grid_size - 1, 0]
    corners << [@grid_size - 1, @grid_size - 1]
    princess_position = get_princess_position(@grid_size, @grid)
    expect(corners).to include(princess_position)
  end
  it 'to confirm if the bot is reaching to princess' do
    bot_x = bot_y = get_bot_position(@grid_size, @grid)
    princess_x, princess_y = get_princess_position(@grid_size, @grid)
    bot_reached_towards_princess = bot_moves_towards_princess(bot_x, bot_y, princess_x, princess_y)
    expect(bot_reached_towards_princess).to eql true
  end
end
