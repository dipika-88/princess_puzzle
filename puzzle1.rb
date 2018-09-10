# frozen_string_literal: true

def display_path_to_princess(grid_size, grid)
  raise 'Grid size should be odd number.' if grid_size.even?
  raise 'Grid size should be between (3 >= n < 100)' if grid_size < 3 || grid_size > 100

  bot_x = bot_y = get_bot_position(grid_size, grid)
  princess_x, princess_y = get_princess_position(grid_size, grid)
  bot_moves_towards_princess(bot_x, bot_y, princess_x, princess_y)
end

def get_bot_position(grid_size, grid)
  center = grid_size / 2
  raise 'Bot position is not in the center.' unless grid[center][center] == 'm'

  center
end

def get_princess_position(grid_size, grid)
  return 0, 0 if grid[0][0] == 'p'
  return 0, grid_size - 1 if grid[0][grid_size - 1] == 'p'
  return grid_size - 1, 0 if grid[grid_size - 1][0] == 'p'
  return grid_size - 1, grid_size - 1 if grid[grid_size - 1][grid_size - 1] == 'p'

  raise 'Error occured... Bot is not able to find the princess position in the corners.'
end

def bot_moves_towards_princess(bot_x, bot_y, princess_x, princess_y)
  return true if bot_x == princess_x && bot_y == princess_y

  if bot_y < princess_y
    puts 'Right'
    bot_y += 1
  elsif bot_y > princess_y
    puts 'LEFT'
    bot_y -= 1
  elsif bot_x < princess_x
    puts 'DOWN'
    bot_x += 1
  elsif bot_x > princess_x
    puts 'UP'
    bot_x -= 1
  end
  bot_moves_towards_princess(bot_x, bot_y, princess_x, princess_y)
end

# Here m denotes the bot position and p denotes the princess position
grid_size = 5
grid = [['-', '-', '-', '-', '_'],
        ['-', '-', '-', '-', '-'],
        ['-', '-', 'm', '-', '-'],
        ['-', '-', '-', '-', '-'],
        ['p', '-', '-', '-', '-']]
display_path_to_princess(grid_size, grid)
