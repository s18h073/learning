print("整数を入力してください：")
input = gets.chomp.to_i

if input < 0
    puts("自然数を入力してください")
elsif input % 10 == 0
    puts("10で割り切れます")
elsif input % 5 == 0
    puts("5で割り切れます")
elsif input % 2 == 1
    puts("奇数です")
else
    puts("自然数です")
end