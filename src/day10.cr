enum Delim
    Paren
    Curly
    Square
    Arrow
end

def part1
    puzzle = File.read_lines("./inputs/day10").map do |line|
        c = line.chars
        stack = [] of Delim
        errorIndex = -1
        errors = [] of Int32
        c.each_index do |i|
            ch = c[i]

            if errorIndex != -1
                break
            end

            case ch
            when '{'
                stack.push(Delim::Curly)
            when '('
                stack.push(Delim::Paren)
            when '['
                stack.push(Delim::Square)
            when '<'
                stack.push(Delim::Arrow)
            when '}'
                if stack.pop() != Delim::Curly
                    errors.push(1197)
                    errorIndex = i
                end
            when ')'
                if stack.pop() != Delim::Paren
                    errors.push(3)
                    errorIndex = i
                end
            when ']'
                if stack.pop() != Delim::Square
                    errors.push(57)
                    errorIndex = i
                end
            when '>'
                if stack.pop() != Delim::Arrow
                    errors.push(25137)
                    errorIndex = i
                end
            else
                raise "Invalid"
            end
        end

        # puts errors
        errors.sum
    end

    puzzle.sum
end

def part2
    puzzle = File.read_lines("./inputs/day10").compact_map do |line|
        c = line.chars
        corrupted = false
        stack = [] of Delim
        c.each_index do |i|
            ch = c[i]

            if corrupted
                break
            end

            case ch
            when '{'
                stack.push(Delim::Curly)
            when '('
                stack.push(Delim::Paren)
            when '['
                stack.push(Delim::Square)
            when '<'
                stack.push(Delim::Arrow)
            when '}'
                if stack.pop() != Delim::Curly
                    corrupted = true
                    break
                end
            when ')'
                if stack.pop() != Delim::Paren
                    corrupted = true
                    break
                end
            when ']'
                if stack.pop() != Delim::Square
                    corrupted = true
                    break
                end
            when '>'
                if stack.pop() != Delim::Arrow
                    corrupted = true
                    break
                end
            else
                raise "Invalid"
            end
        end

        if corrupted
            nil
        else
            sum : Int64 = 0
            (0..stack.size-1).each do |s|
                sum *= 5
                v = case stack.pop()
                when Delim::Paren
                    1
                when Delim::Square
                    2
                when Delim::Curly
                    3
                when Delim::Arrow
                    4
                else
                    0
                end
                sum += v
            end
            sum
        end
    end

    puzzle.sort!

    puzzle[(puzzle.size / 2).to_i32]
end

puts "Day 10, Part 1: #{part1()}"
puts "Day 10, Part 2: #{part2()}"
