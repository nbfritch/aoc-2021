def part1
  puzzle = File.read("./inputs/day6").split(",").map { |x| x.to_i32 }

  days = 80
  (1..days).each do |d|
    newFish = 0
    puzzle = puzzle.map do |f|
      if f == 0
        newFish += 1
        6
      else
        f - 1
      end
    end

    newFish.times do |x|
      puzzle.push(8)
    end
  end

  puzzle.size
end

def part2
  puzzle = File.read("./inputs/day6").split(",").map { |x| x.to_i32 }

  values = [0, 0, 0, 0, 0, 0, 0, 0, 0].map { |x| x.to_i64 }

  puzzle.each do |p|
    values[p] += 1
  end

  days = 256
  (1..days).each do |d|
    v = values[0]
    values[7] += v
    values.shift
    values = values.push v
  end

  values.sum
end

puts "Day 6, Part 1: #{part1()}"
puts "Day 6, Part 2: #{part2()}"
