enum Direction
  Up
  Down
  Forward
end

def part1
  puzzle = File.read_lines("./inputs/day2").map do |l|
    s = l.split(" ")
    d = case s[0]
        when "forward"
          Direction::Forward
        when "up"
          Direction::Up
        else
          Direction::Down
        end
    {d, s[1].to_i32}
  end

  horizontal = 0
  depth = 0
  puzzle.each do |x|
    d = x.[0]
    n = x.[1]
    case d
    when Direction::Forward
      horizontal = horizontal + n
    when Direction::Up
      depth = depth - n
    when Direction::Down
      depth = depth + n
    end
  end

  puts horizontal
  puts depth
  puts horizontal * depth
end

def part2
  puzzle = File.read_lines("./inputs/day2").map do |l|
    s = l.split(" ")
    d = case s[0]
        when "forward"
          Direction::Forward
        when "up"
          Direction::Up
        else
          Direction::Down
        end
    {d, s[1].to_i32}
  end

  horizontal = 0
  depth = 0
  aim = 0
  puzzle.each do |x|
    d = x.[0]
    n = x.[1]
    case d
    when Direction::Forward
      horizontal = horizontal + n
      depth = depth + (aim * n)
    when Direction::Up
      aim = aim - n
    when Direction::Down
      aim = aim + n
    end
  end

  puts horizontal
  puts depth
  puts depth * horizontal
end

part1()
part2()
