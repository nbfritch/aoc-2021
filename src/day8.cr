def part1
  puzzle = File.read_lines("./inputs/day8").map do |line|
    h = line.split(" | ")[1]
    counts = h.split(" ").map { |x| x.size }
    counts.map { |c| (c == 2 || c == 3 || c == 4 || c == 7) ? 1 : 0 }.sum
  end

  puzzle.sum
end

def part2
  puzzle = File.read_lines("./inputs/day8").map do |line|
    parts = line.split(" | ")
    keys = parts[0].split(" ").map { |l| l.chars.sort.to_set }
    values = parts[1].split(" ").map { |l| l.chars.sort.to_set }

    decodedKeys = Hash(Int32, Set(Char)).new
    keys.each do |key|
      s = key.size
      if s == 2
        decodedKeys[1]= key
      elsif s == 3
        decodedKeys[7]= key
      elsif s == 4
        decodedKeys[4]= key
      elsif s == 7
        decodedKeys[8]= key
      end
    end

    keys.each do |key|
      s = key.size
      if s == 5
        oneInt = (key & decodedKeys[1]).size
        fourInt = (key & decodedKeys[4]).size
        sevenInt = (key & decodedKeys[7]).size 

        if oneInt == 1 && fourInt == 2 && sevenInt == 2
          decodedKeys[2]= key
        elsif oneInt == 2 && fourInt == 3 && sevenInt == 3
          decodedKeys[3]= key
        elsif oneInt == 1 && fourInt == 3 && sevenInt == 2
          decodedKeys[5]= key
        else
          raise "Could not decode key!"
        end
      end

      if s == 6
        oneInt = (key & decodedKeys[1]).size
        fourInt = (key & decodedKeys[4]).size
        sevenInt = (key & decodedKeys[7]).size 

        if oneInt == 2 && fourInt == 3 && sevenInt == 3
          decodedKeys[0]= key
        elsif oneInt == 1 && fourInt == 3 && sevenInt == 2
          decodedKeys[6]= key
        elsif oneInt == 2 && fourInt == 4 && sevenInt == 3
          decodedKeys[9]= key
        else
          raise "Could not decode key!"
        end
      end
    end

    flipSet = Hash(Set(Char), Int32).new
    decodedKeys.each do |d|
      flipSet[d[1]]= d[0]
    end

    thou = -1
    hund = -1
    tens = -1
    ones = -1

    values.each_index do |vi|
      case vi
      when 0
        thou = flipSet[values[0]]
      when 1
        hund = flipSet[values[1]]
      when 2
        tens = flipSet[values[2]]
      when 3
        ones = flipSet[values[3]]
      else
        raise "Iono"
      end
    end

    c = thou * 1000 + hund * 100 + tens * 10 + ones
    c
  end

  puzzle.sum
end

puts "Day 8, Part 1: #{part1()}"
puts "Day 8, Part 2: #{part2()}"

