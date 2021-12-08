def part1
    puzzle = File.read("./inputs/day7").split(",").map { |x| x.to_i32 }

    puzzle.each { |x| puts x }

    puzzle.sort!

    low = -1
    val = -1
    (puzzle.min..puzzle.max).each do |p|
        x = puzzle.map { |y| (p - y).abs }.sum
        if x < low || low == -1
            low = x
            val = p
        end
    end

    puts "Lowest cost of #{low} at #{val}"
end

def fastSum(n : Int64)
    (n * n + n) / 2
end

def part2
    puzzle = File.read("./inputs/day7").split(",").map { |x| x.to_i64 }

    puzzle.each { |x| puts x }

    puzzle.sort!

    low = -1
    val = -1
    (puzzle.min..puzzle.max).each do |p|
        x = puzzle.map { |y| fastSum((p - y).abs) }.sum
        if x < low || low == -1
            low = x
            val = p
        end
    end

    puts "Lowest cost of #{low} at #{val}"
end

part1()
part2()