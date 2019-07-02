puts "三目並べスタート"
zyunban = 0
zyunban_list = ["先攻", "後攻"]
game_field = Array.new(9, "　")
input = []

def convert_input_to_game_field(input)
    res = 4
    if input[0] + input[1] == 2
        res = 0
    elsif input[0] + input[1] == 6
        res = 8
    elsif input[0] < input[1]
        if input[0] + input[1] == 3
            res = 1
        elsif input[0] + input[1] == 4
            res = 2
        else
            res = 5
        end
    elsif input[0] > input[1]
        if input[0] + input[1] == 3
            res = 3
        elsif input[0] + input[1] == 4
            res = 6
        else
            res = 7
        end
    end
    return res
end

def continue?(game_field)
    g_f = game_field.dup
    game_field1 = []
    game_field2 = []
    hosei = 0
    loop do
        if g_f.find_index {|n| n == "〇"}
            game_field1.push(g_f.find_index {|n| n == "〇"} + hosei)
            g_f.delete_at(g_f.find_index {|n| n == "〇"})
        else
            break
        end
        hosei += 1
    end
    g_f = game_field.dup
    hosei = 0
    loop do
        if g_f.find_index {|n| n == "✕"}
            game_field2.push(g_f.find_index {|n| n == "✕"} + hosei)
            g_f.delete_at(g_f.find_index {|n| n == "✕"})
        else
            break
        end
        hosei += 1
    end

    if game_field1.select {|n| n % 2 == 0 && n <= 6 && n >= 2}.length == 3 || game_field1.select {|n| n % 4 == 0}.length == 3 || game_field1.select {|n| n % 3 == 0}.length == 3 || game_field1.select {|n| n % 3 == 1}.length == 3 || game_field1.select {|n| n % 3 == 2}.length == 3 || game_field1.select {|n| n < 3}.length == 3 || game_field1.select {|n| n > 5}.length == 3 || game_field1.select {|n| n<6 && n>3}.length == 3
        return 0
    elsif game_field2.select {|n| n % 2 == 0 && n <= 6 && n >= 2}.length == 3 || game_field2.select {|n| n % 4 == 0}.length == 3 || game_field2.select {|n| n % 3 == 0}.length == 3 || game_field2.select {|n| n % 3 == 1}.length == 3 || game_field2.select {|n| n % 3 == 2}.length == 3 || game_field2.select {|n| n < 3}.length == 3 || game_field2.select {|n| n > 5}.length == 3 || game_field2.select {|n| n<6 && n>3}.length == 3
        return 1
    end
    return false
end

loop do
    puts "\n　１　２　３"
    puts "１#{game_field[0]}｜#{game_field[1]}｜#{game_field[2]}"
    puts "　ーーーーー"
    puts "２#{game_field[3]}｜#{game_field[4]}｜#{game_field[5]}"
    puts "　ーーーーー"
    puts "３#{game_field[6]}｜#{game_field[7]}｜#{game_field[8]}"

    puts "\n#{zyunban_list[zyunban%2]}のターン"
    loop do
        print "縦の番号を入力："  
        loop do 
            input[0] = gets.chomp.to_i
            if 1 <= input[0] && input[0] <= 3
                break
            end
            print "1~3を入力："
        end
        print "横の番号を入力："  
        loop do 
            input[1] = gets.chomp.to_i
            if 1 <= input[1] && input[1] <= 3
                break
            end
            print "1~3を入力："
        end

        if game_field[convert_input_to_game_field(input)] == "　"
            if zyunban%2 == 0
                ch = "〇"
            else
                ch = "✕"
            end
            game_field[convert_input_to_game_field(input)] = ch
            break
        end
        puts "その座標にはすでに書き込まれています"
    end

    if continue?(game_field)
        puts "\n#{zyunban_list[continue?(game_field)]}の勝利"
        break
    end

    if game_field.select {|n| n == "　"}.length == 0
        break
    end

    zyunban += 1
end

puts "\n-game_result-"
puts "　１　２　３"
puts "１#{game_field[0]}｜#{game_field[1]}｜#{game_field[2]}"
puts "　ーーーーー"
puts "２#{game_field[3]}｜#{game_field[4]}｜#{game_field[5]}"
puts "　ーーーーー"
puts "３#{game_field[6]}｜#{game_field[7]}｜#{game_field[8]}"
puts "-------------"