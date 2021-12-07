def part1
  puzzle = File.read_lines("./inputs/day3")
  majority = puzzle.size / 2
  counts = (0..11).map do |_|
    0
  end
  puzzle.each do |p|
    (0..p.size - 1).each do |i|
      if p[i] == '1'
        counts[i] += 1
      end
    end
  end

  cstr = counts.map { |c| c > majority ? 'x' : 'o' }.join("")
  gamma = cstr.gsub('x', '1').gsub('o', '0').to_i32(2)
  epsilon = cstr.gsub('x', '0').gsub('o', '1').to_i32(2)
  puts gamma * epsilon
  gamma * epsilon
end

def part2
  puzzle_master = File.read_lines("./inputs/day3")
  puzzle = puzzle_master.clone
  oxy : Int64 = -1
  co2 : Int64 = -1
  (0..11).each do |i|
    ones = 0
    zeros = 0
    puzzle.each do |line|
      if (line[i] == '1')
        ones += 1
      else
        zeros += 1
      end
    end

    if ones >= zeros
      puzzle.select! { |x| x[i] == '1' }
    else
      puzzle.select! { |x| x[i] == '0' }
    end

    if puzzle.size == 1
      oxy = puzzle[0].to_i64(2)
      break
    end
  end

  puzzle = puzzle_master.clone

  (0..11).each do |i|
    ones = 0
    zeros = 0
    puzzle.each do |line|
      if (line[i] == '1')
        ones += 1
      else
        zeros += 1
      end
    end

    if ones < zeros
      puzzle.select! { |x| x[i] == '1' }
    else
      puzzle.select! { |x| x[i] == '0' }
    end

    if puzzle.size == 1
      co2 = puzzle[0].to_i64(2)
      break
    end
  end

  puts oxy * co2
end

part1()
part2()
