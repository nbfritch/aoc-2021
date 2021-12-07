struct Space
  property marked
  property value

  def initialize(@marked : Bool, @value : Int32)
  end
end

def hasWon(b : Array(Array(Int32)), guessed : Set(Int32))
  (0..b.size - 1).each do |i|
    if b[i].all? { |x| guessed.includes?(x) }
      return true
    end

    if b.map { |x| x[i] }.all? { |x| guessed.includes?(x) }
      return true
    end
  end
  return false
end

def part1
  puzzle = File.read("./inputs/day4").split("\n\n")

  guesses = puzzle[0].split(",").map { |g| g.to_i32 }

  boards = puzzle[1..].map do |p|
    p.split("\n").map do |x|
      x.split(" ").reject { |z| z.size < 1 }.map { |y| y.to_i32 }
    end
  end

  guessed = Set(Int32).new

  guesses.each do |g|
    guessed.add(g)
    boards.each do |board|
      if hasWon(board, guessed)
        count = 0
        board.each do |row|
          row.each do |v|
            if !guessed.includes?(v)
              count += v
            end
          end
        end
        puts "#{g} * #{count} = #{g*count}"
        return
      end
    end
  end
end

def part2
  puzzle = File.read("./inputs/day4").split("\n\n")

  guesses = puzzle[0].split(",").map { |g| g.to_i32 }

  boards = puzzle[1..].map do |p|
    p.split("\n").map do |x|
      x.split(" ").reject { |z| z.size < 1 }.map { |y| y.to_i32 }
    end
  end

  guessed = Set(Int32).new

  wonAt = Hash(Int32, Int32).new
  winKey = -1

  guesses.each do |g|
    guessed.add(g)
    boards.each_index do |ib|
      board = boards[ib]
      if hasWon(board, guessed) && !wonAt.includes?(ib)
        count = 0
        board.each do |row|
          row.each do |v|
            if !guessed.includes?(v)
              count += v
            end
          end
        end

        if !wonAt[ib]?
          wonAt[ib] = count*g
          winKey = ib
        end
      end
    end
  end

  puts wonAt[winKey]
end

part1()
part2()
