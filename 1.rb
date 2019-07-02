count = 0
zyunban = 0
input = 0
zyunban_list = ["先攻", "後攻"]
loop do
    puts("#{zyunban_list[zyunban%2]}プレイヤーさん、数える数字を選択してください")
    print("[1] #{count+1}")
    zyouken = 1
    if count < 19
        print(", [2] #{count+2}")
        zyouken = 2
    end
    if count < 18
        print(", [3] #{count+3}")
        zyouken = 3
    end
    puts("")

    loop do
        input = gets.chomp.to_i
        if 1 <= input && input <= zyouken
            break
        end
        puts("出力された選択肢の中から選んでください")
    end

    count += input
    if count == 20
        puts("#{zyunban_list[(zyunban+1)%2]}プレイヤーさんの勝利です")
        break
    end

    zyunban += 1
end