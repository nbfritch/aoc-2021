def part1
  puts "Day 1: Part 1"
  puzzle = File.read_lines("./inputs/day1").map { |l| l.to_i32 }

  diffs = [] of Int32
  to = puzzle.size - 2
  puzzle.each_index do |i|
    if i <= to
      diffs.push(puzzle[i + 1] - puzzle[i])
    end
  end

  diffs.count do |i|
    i > 0
  end
end

def part2
  puts "Day 1: Part 2"
  puzzle = File.read_lines("./inputs/day1").map { |l| l.to_i32 }
  diffs = [] of Int32
  to = puzzle.size - 4
  puzzle.each_index do |i|
    if i <= to
      hi = puzzle[i + 1..i + 3].sum

      diffs.push(puzzle[i + 1..i + 3].sum - puzzle[i..i + 2].sum)
    end
  end

  diffs.count do |i|
    i > 0
  end
end

puts part1()
puts part2()
