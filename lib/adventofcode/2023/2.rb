data = DATA.read.split("\n")
h = { "red" => 12, "green" => 13, "blue" => 14 }

def sol(data, h)
    possible_games = []
    sum = 0
    data.each do |line|
        line = line.split(": ")
        game_number = line[0].split(" ")[1]
        possible = true
        m = {"red" => 0, "green" => 0, "blue" => 0}

        pulls = line[1].split("; ")
        pulls.each do |pull|
            colors = pull.split(", ")
            colors.each do |color|
                a, c = color.split(/\s+/)
                possible = false if a.to_i > h[c]
                m[c] = a.to_i if a.to_i > m[c]
            end
        end
        sum += m.values.reduce(:*)
        possible_games << game_number.to_i if possible
    end

    return possible_games.sum, sum
end
puts "Part 1,2: #{sol(data, h)}"


__END__
Game 1: 4 red, 8 green; 8 green, 6 red; 13 red, 8 green; 2 blue, 4 red, 4 green
Game 2: 5 blue; 1 red, 3 blue; 1 red, 7 blue, 1 green; 1 red, 8 blue; 7 blue, 1 red; 4 blue, 1 green, 1 red
Game 3: 8 blue, 5 green, 15 red; 6 red, 6 blue, 3 green; 8 red, 2 green; 10 blue, 10 red, 6 green; 8 red, 6 blue; 15 red, 5 green, 2 blue
Game 4: 10 green, 12 red, 14 blue; 5 green, 9 red, 7 blue; 14 blue, 12 red; 8 blue, 7 green, 11 red
Game 5: 13 blue, 10 red, 7 green; 3 green, 8 red, 4 blue; 16 red, 5 green, 5 blue; 2 blue, 9 red, 7 green; 5 red, 14 blue, 3 green; 2 red, 11 blue, 2 green
Game 6: 3 blue, 1 green; 10 green, 12 red, 6 blue; 3 green, 2 red, 5 blue; 2 blue, 11 green, 2 red; 1 red, 5 blue, 9 green
Game 7: 2 blue, 10 green; 3 red, 10 blue; 3 green, 8 blue, 5 red; 8 green, 10 blue, 2 red
Game 8: 15 red, 12 blue, 5 green; 10 red, 12 blue, 5 green; 10 red, 7 green
Game 9: 18 blue, 14 red; 3 green, 9 blue; 1 blue, 11 red; 5 red, 7 blue, 3 green; 8 red, 4 green, 1 blue
Game 10: 2 blue; 10 green, 4 blue, 3 red; 5 green, 4 red, 4 blue; 1 red, 3 blue, 4 green; 2 blue, 5 red, 3 green; 3 green, 2 red, 2 blue
Game 11: 4 blue, 19 green; 19 blue, 12 green, 17 red; 11 red, 10 blue, 17 green; 9 green, 18 blue; 14 green, 9 red, 18 blue; 15 blue, 6 green, 19 red
Game 12: 1 green, 6 blue, 2 red; 6 blue, 2 red, 8 green; 2 green, 2 red, 7 blue; 1 red, 3 blue, 6 green
Game 13: 2 red, 11 blue, 4 green; 2 red, 7 blue; 9 green, 1 red, 12 blue; 13 blue, 8 green; 11 blue, 8 green, 1 red; 1 red, 2 blue
Game 14: 1 green, 4 blue, 11 red; 11 green, 6 blue, 7 red; 7 green, 6 blue, 4 red; 12 blue, 10 red, 11 green
Game 15: 1 green, 19 red, 3 blue; 11 red, 3 blue; 20 red, 4 blue
Game 16: 3 red, 1 green, 7 blue; 3 blue, 4 red, 1 green; 6 blue, 7 red, 3 green
Game 17: 7 blue, 4 red, 19 green; 7 green, 4 red; 8 green, 2 red, 4 blue
Game 18: 1 red, 1 blue, 6 green; 2 red, 6 green, 1 blue; 4 green, 1 red, 1 blue
Game 19: 4 blue, 8 green, 6 red; 2 red, 9 green, 4 blue; 9 green, 8 red, 6 blue; 3 red, 6 blue, 9 green; 8 red, 4 blue, 7 green
Game 20: 3 blue, 7 green, 13 red; 13 blue; 12 red, 14 blue; 3 red, 6 green, 8 blue
Game 21: 5 green, 2 red, 10 blue; 2 red, 2 green, 6 blue; 1 blue, 1 red, 7 green; 4 blue, 1 red, 2 green
Game 22: 2 red; 1 green, 7 red; 3 red, 1 green, 1 blue; 4 red, 5 green, 3 blue; 1 blue, 2 green
Game 23: 15 red, 1 blue, 3 green; 6 blue, 3 green, 2 red; 6 green, 4 red, 1 blue
Game 24: 17 green; 1 red, 2 blue, 3 green; 10 blue, 1 green; 1 green; 1 red, 2 blue, 1 green
Game 25: 2 green, 8 blue, 1 red; 1 blue, 1 red, 9 green; 1 blue, 2 green, 2 red; 3 red, 6 blue
Game 26: 12 red, 19 green, 4 blue; 2 red, 10 blue, 15 green; 14 blue, 17 red, 3 green; 1 green, 15 red, 3 blue
Game 27: 11 green, 1 red, 9 blue; 3 green, 10 blue; 9 green, 10 blue, 1 red; 4 green, 3 blue, 1 red; 2 blue, 5 green, 2 red; 17 blue, 2 red, 5 green
Game 28: 10 green, 10 red, 5 blue; 5 red, 4 blue, 8 green; 3 green, 10 red, 3 blue; 2 blue, 8 green, 1 red; 6 red, 1 green, 4 blue
Game 29: 3 blue, 11 red, 1 green; 5 blue, 3 green, 6 red; 8 red, 12 blue, 10 green; 1 blue, 4 red, 1 green
Game 30: 10 blue, 1 red, 2 green; 1 red, 8 blue, 2 green; 4 blue, 3 green; 5 green, 1 red, 3 blue; 3 green, 14 blue
Game 31: 3 red, 7 green, 6 blue; 11 red, 4 green, 2 blue; 1 green, 11 red, 8 blue; 6 green, 5 blue, 5 red; 4 green, 3 blue, 15 red
Game 32: 9 green, 1 blue, 10 red; 13 red, 7 green; 12 red, 6 green, 1 blue
Game 33: 9 green, 4 red, 6 blue; 2 red, 4 blue, 1 green; 2 blue, 11 red, 9 green
Game 34: 8 green, 6 red; 4 blue, 3 green; 6 red, 1 blue, 9 green; 10 green, 1 red; 2 red, 2 blue, 2 green; 2 blue
Game 35: 4 blue, 8 green, 8 red; 1 blue, 10 green; 5 green, 8 red; 4 green; 6 red, 1 blue, 6 green
Game 36: 4 red, 10 blue, 16 green; 18 blue, 5 red, 5 green; 16 green, 11 blue, 1 red; 6 green, 10 blue; 4 red, 9 green, 17 blue; 1 red, 9 blue, 14 green
Game 37: 1 red, 13 green, 5 blue; 2 red, 12 green, 12 blue; 5 red, 11 blue, 5 green; 9 green, 4 blue
Game 38: 1 green, 12 blue, 1 red; 11 blue, 3 red, 1 green; 17 red, 11 blue; 8 red, 2 blue
Game 39: 11 blue, 12 red, 1 green; 1 blue, 1 green, 4 red; 3 green, 6 blue, 3 red
Game 40: 1 blue, 1 red; 9 green, 2 red, 2 blue; 9 green, 3 red; 8 green, 4 blue, 4 red; 3 green, 3 red
Game 41: 7 blue, 8 red, 3 green; 4 red, 7 green, 1 blue; 5 blue, 6 red, 5 green; 4 blue, 9 red; 2 green, 9 blue, 5 red
Game 42: 8 blue, 17 green, 7 red; 6 red, 11 green, 13 blue; 7 red, 3 blue, 14 green; 2 red, 12 blue, 2 green; 18 green, 8 red; 10 green, 5 blue
Game 43: 5 green, 9 red, 3 blue; 3 red, 5 green; 6 green, 1 blue, 10 red; 8 blue, 1 green, 2 red
Game 44: 1 red, 5 blue; 4 green, 6 red, 2 blue; 12 green, 8 red; 4 blue, 2 red, 9 green; 1 blue, 5 green, 3 red
Game 45: 9 blue, 5 red, 6 green; 10 blue, 7 green, 8 red; 1 red, 1 green, 10 blue; 2 red, 1 green, 11 blue; 11 red
Game 46: 14 blue, 8 green, 2 red; 10 green, 8 blue; 7 blue, 12 green; 14 green, 10 blue, 2 red
Game 47: 5 blue, 7 green, 1 red; 5 blue, 5 green, 3 red; 2 red, 8 green, 3 blue; 2 red, 2 green
Game 48: 2 red, 2 blue, 1 green; 1 green, 1 blue, 3 red; 1 blue, 1 red; 3 green, 8 blue
Game 49: 7 red, 2 blue, 8 green; 8 red, 4 green; 2 blue, 4 red, 8 green
Game 50: 9 red, 4 blue, 10 green; 11 red, 7 green, 4 blue; 4 green, 16 red, 2 blue; 13 red, 9 blue, 3 green; 1 red, 6 blue
Game 51: 8 blue, 2 red, 3 green; 2 blue, 2 red; 4 blue, 1 green; 1 red, 2 blue, 2 green; 5 green, 6 blue, 1 red
Game 52: 12 blue, 8 red; 11 green, 9 red, 11 blue; 8 blue, 5 green, 8 red; 3 red, 11 blue, 11 green; 12 blue, 6 green, 5 red; 10 red, 8 green
Game 53: 9 green, 6 red, 3 blue; 4 blue, 5 green, 3 red; 11 green, 5 blue, 2 red; 4 red, 9 green
Game 54: 13 blue, 8 green; 15 blue, 3 red, 7 green; 8 green, 1 blue; 8 blue, 3 red, 6 green; 3 red, 1 green, 12 blue; 9 green, 3 red, 2 blue
Game 55: 2 red, 1 blue, 2 green; 4 blue, 3 green, 1 red; 4 red, 7 green, 4 blue; 7 green, 3 red, 1 blue; 2 blue, 4 green, 1 red; 5 blue, 1 red, 4 green
Game 56: 14 green, 1 blue, 4 red; 3 red, 1 blue; 10 red, 8 blue; 8 red, 7 blue, 3 green; 3 green, 12 blue, 4 red; 7 red, 2 green
Game 57: 7 blue, 8 green, 6 red; 7 green, 5 blue, 3 red; 2 red, 8 blue, 9 green
Game 58: 7 green, 8 red, 3 blue; 7 red, 5 blue, 9 green; 4 blue, 3 red, 9 green; 1 green; 5 green, 2 blue; 5 blue, 7 green, 2 red
Game 59: 2 blue, 10 green; 8 blue, 10 red, 1 green; 1 red, 10 blue, 7 green; 2 red, 7 blue, 1 green; 5 green, 3 blue
Game 60: 1 green, 2 blue; 5 red, 2 green, 2 blue; 2 green, 3 red
Game 61: 3 green, 2 red; 10 green, 7 red, 2 blue; 8 green, 2 blue; 5 green, 3 red, 1 blue; 12 green, 1 red; 1 blue, 13 green, 6 red
Game 62: 11 green, 2 red; 3 blue, 3 red; 2 blue, 1 red, 10 green; 11 green, 3 blue
Game 63: 7 blue; 7 red, 1 green, 8 blue; 5 red, 14 blue, 1 green
Game 64: 2 green, 12 blue, 1 red; 18 blue, 10 red; 9 blue, 2 green, 13 red; 1 red, 1 green, 15 blue
Game 65: 6 blue, 8 red, 8 green; 2 green, 9 red, 9 blue; 3 green, 9 red, 1 blue; 10 red, 4 blue, 2 green; 7 blue, 5 red, 5 green
Game 66: 14 red, 3 green, 9 blue; 3 blue, 7 green, 12 red; 5 red, 8 green, 1 blue; 12 red, 5 green, 4 blue; 5 green, 14 blue
Game 67: 1 blue, 9 red, 7 green; 12 red, 9 green, 1 blue; 13 red, 4 green, 2 blue; 1 red, 1 blue, 5 green; 10 red, 2 blue
Game 68: 12 green, 2 red; 1 red, 4 green, 7 blue; 3 red, 4 blue, 14 green; 6 blue, 6 green; 7 blue, 4 green, 3 red
Game 69: 2 green, 17 blue, 9 red; 6 blue, 3 green, 4 red; 11 blue, 4 red, 6 green
Game 70: 11 blue, 10 red, 12 green; 9 red, 10 blue, 5 green; 2 red, 3 green, 9 blue; 5 green, 6 blue, 6 red; 12 green, 8 red, 10 blue
Game 71: 7 blue, 3 red; 1 green, 11 blue, 1 red; 1 red, 5 blue, 1 green
Game 72: 9 red, 7 blue; 1 green, 6 blue; 15 red, 6 blue; 5 red, 4 blue; 4 blue, 4 red, 1 green
Game 73: 10 green, 4 red; 1 green, 5 red; 3 red, 1 green; 1 blue, 9 green, 6 red
Game 74: 6 red, 3 blue, 8 green; 5 green, 9 red, 1 blue; 1 blue, 1 green, 2 red
Game 75: 2 blue, 3 green; 3 blue, 7 green, 1 red; 6 green, 1 red; 5 green, 1 blue; 7 green, 3 blue
Game 76: 4 red, 2 blue; 1 green, 7 red; 2 blue, 3 red; 1 green, 1 red, 1 blue; 4 red, 1 green
Game 77: 18 green, 19 red, 11 blue; 1 blue, 18 red; 5 blue, 10 red, 16 green
Game 78: 3 red, 8 blue, 1 green; 2 red, 3 blue; 1 green, 6 red, 12 blue
Game 79: 5 red, 4 green, 9 blue; 3 blue; 4 red, 5 green, 2 blue; 7 blue, 5 green, 8 red; 5 red, 6 green; 7 blue, 5 green
Game 80: 8 green, 11 red, 3 blue; 15 red, 4 blue, 8 green; 6 green, 14 red
Game 81: 11 green, 5 red; 7 green, 14 blue, 4 red; 7 red, 8 blue, 2 green; 10 red, 3 green, 18 blue; 3 red, 1 green
Game 82: 2 blue, 5 red; 3 green, 5 red, 7 blue; 3 green, 4 blue, 2 red; 10 blue, 2 green, 2 red; 8 blue, 2 red; 3 green, 3 red, 7 blue
Game 83: 7 red, 12 green, 1 blue; 5 blue, 17 green, 5 red; 9 red, 3 blue; 2 blue, 1 red, 20 green; 5 red, 6 blue; 2 blue, 3 red, 11 green
Game 84: 1 blue, 7 red, 6 green; 6 red, 8 green, 10 blue; 8 green, 1 blue, 6 red; 8 red, 4 blue, 6 green; 3 red, 12 blue, 8 green; 3 red, 2 blue, 7 green
Game 85: 1 blue, 1 green, 8 red; 9 blue, 9 green, 2 red; 10 green, 12 red, 7 blue; 7 green, 2 blue, 7 red; 7 red, 3 green; 11 red, 9 blue, 5 green
Game 86: 4 blue, 8 red; 4 red, 3 green; 7 blue, 12 red, 4 green; 4 green, 8 blue, 3 red
Game 87: 6 blue, 19 green, 5 red; 20 green, 5 red, 5 blue; 8 red, 3 blue, 9 green; 11 blue, 7 green, 7 red; 17 green, 11 blue
Game 88: 1 green, 2 red, 5 blue; 2 blue, 11 green; 3 red, 3 blue, 6 green; 4 blue, 2 green, 1 red; 8 green, 4 blue
Game 89: 19 red, 15 green, 10 blue; 17 green, 1 red, 4 blue; 13 green, 10 blue, 15 red
Game 90: 3 blue, 1 red; 4 blue, 1 red, 1 green; 4 green, 3 red; 4 red, 4 green, 5 blue; 2 green, 3 blue; 4 red, 2 green, 4 blue
Game 91: 8 red, 4 blue, 16 green; 17 green, 5 blue, 4 red; 10 green, 6 red; 11 red, 7 blue; 14 blue, 4 red
Game 92: 1 green, 3 red, 1 blue; 2 blue, 2 green, 5 red; 2 blue, 8 red; 1 blue, 2 green, 14 red; 3 red; 1 blue, 9 red
Game 93: 11 blue, 7 red, 8 green; 8 red, 6 blue, 5 green; 4 blue, 4 green, 6 red
Game 94: 2 green, 1 blue; 5 green, 5 red, 4 blue; 7 green, 2 blue; 5 red, 1 green, 3 blue; 2 blue, 1 green, 5 red; 1 red, 3 blue, 5 green
Game 95: 3 red; 7 green, 4 red, 7 blue; 5 red, 5 blue
Game 96: 3 red, 5 blue, 1 green; 3 blue, 14 red, 2 green; 7 blue, 3 red, 2 green; 15 red, 5 blue
Game 97: 17 red, 8 green, 6 blue; 8 blue, 9 green; 4 green, 18 red
Game 98: 9 blue, 2 green; 4 red, 6 blue, 3 green; 2 red; 14 red, 12 blue
Game 99: 4 red, 3 green, 3 blue; 2 red, 2 blue; 7 green, 3 blue; 5 red, 2 green
Game 100: 5 green, 7 red, 4 blue; 11 green, 9 red, 8 blue; 2 blue, 12 green
