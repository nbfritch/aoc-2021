def part1
    puzzle = File.read_lines("./inputs/day9").map { |line| line.chars.map { |y| y.to_i8 } }

    height = puzzle.size
    width = puzzle[0].size

    puts puzzle

    risk_level = 0
    (0..height-1).each do |h|
        (0..width-1).each do |w|
            neighbors = [] of Int8
            if w > 0
                neighbors.push(puzzle[h][w-1])
            end

            if w < width-1
                neighbors.push(puzzle[h][w+1])
            end

            if h > 0
                neighbors.push(puzzle[h-1][w])
            end

            if h < height-1
                neighbors.push(puzzle[h+1][w])
            end

            cell = puzzle[h][w]

            if neighbors.all? { |n| n > cell }
                puts "Low: #{cell}"
                risk_level += (cell + 1)
            end
        end
    end

    risk_level
end

def basinCrawl(x : Int32, y : Int32, h : Int32, w : Int32, puzzle : Array(Array(Int8)), basin : Set(Tuple(Int32, Int32)), basins : Array(Set(Tuple(Int32, Int32))))
    if x < 0 || x >= w 
        return
    end

    if y < 0 || y >= h
        return
    end

    if puzzle[x][y] == 9
        return
    end

    if basin.includes?({x,y})
        return
    end

    if basins.any? { |b| b.includes?({x,y}) }
        return
    end

    basin.add({x, y})

    basinCrawl(x, y+1, h, w, puzzle, )
end

def part2
    puzzle = File.read_lines("./inputs/day9").map { |line| line.chars.map { |y| y.to_i8 } }

    height = puzzle.size
    width = puzzle[0].size

    basins = Array(Set(Tuple(Int32, Int32))).new

    (0..height-1).each do |h|
        (0..width-1).each do |w|
            if puzzle[h][w] != 9
                print "_"
            else
                print puzzle[h][w]
            end
        end

        puts ""
    end
end

puts "Day 9, Part 1: #{part1()}"
part2()
