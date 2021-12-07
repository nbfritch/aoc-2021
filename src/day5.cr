def part1
  puzzle = File.read_lines("./inputs/day5").compact_map do |line|
    segments = line.split(" -> ").map { |f| f.split(",").map { |z| z.to_i32 } }
    p1 = {segments[0][0], segments[0][1]}
    p2 = {segments[1][0], segments[1][1]}

    p1[0] == p2[0] || p1[1] == p2[1] ? {p1, p2} : nil
  end

  vents = Hash(Tuple(Int32, Int32), Int32).new

  puzzle.each do |t|
    l1 = t[0]
    l1x = l1[0]
    l1y = l1[1]
    l2 = t[1]
    l2x = l2[0]
    l2y = l2[1]

    l1gx = l1x >= l2x

    xf = l1gx ? l1x : l2x
    xt = l1gx ? l2x : l1x

    l1gy = l1y >= l2y
    yf = l1gy ? l1y : l2y
    yt = l1gy ? l2y : l1y

    (xt..xf).each do |x|
      (yt..yf).each do |y|
        t = {x, y}
        if vents[t]?
          vents[t] += 1
        else
          vents[t] = 1
        end
      end
    end
  end

  count = 0
  vents.keys.each do |k|
    v = vents[k]
    if v >= 2
      count += 1
    end
  end

  puts count
end

def part2
  puzzle = File.read_lines("./inputs/day5").map do |line|
    segments = line.split(" -> ").map { |f| f.split(",").map { |z| z.to_i32 } }
    p1 = {segments[0][0], segments[0][1]}
    p2 = {segments[1][0], segments[1][1]}

    {p1, p2}
  end

  vents = Hash(Tuple(Int32, Int32), Int32).new

  puzzle.each do |t|
    l1 = t[0]
    l1x = l1[0]
    l1y = l1[1]
    l2 = t[1]
    l2x = l2[0]
    l2y = l2[1]

    l1xg = l1x > l2x
    l1yg = l1y > l2y

    b = (l1x-l2x).abs == (l1y-l2y).abs

    (0..(l1x-l2x).abs).each do |xx|
      x = l1xg ? l1x - xx : l1x + xx
      (0..(l1y-l2y).abs).each do |yx|
        y = l1yg ? l1y - yx : l1y + yx
        tx = {x, y}
        if (b && xx.abs == yx.abs) || !b
          if vents[tx]?
            vents[tx] += 1
          else
            vents[tx] = 1
          end
        end
      end
    end
  end

  count = 0
  vents.keys.each do |k|
    v = vents[k]
    if v >= 2
      count += 1
    end
  end

  puts count
end

part1()
part2()
# 11340 Too low
# 21536 Too Hight
# 19472
