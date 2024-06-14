puts "じゃんけん・・・・"

def janken
  puts "[0]グー\n[1]チョキ\n[2]パー\n[3]戦わない"

  player_hand = gets.chomp.to_i

  # 入力が0から3の範囲内であるかチェック
  unless (0..3).include?(player_hand)
    puts "0~3の数字を入力してください"
    return true
  end

  program_hand = rand(3)

  jankens = ["グー","チョキ","パー","戦わない"]
  puts "あなたの手:#{jankens[player_hand]}, 相手の手:#{jankens[program_hand]}"

  if player_hand == program_hand
    puts "あいこで"
    return true
  elsif (player_hand == 0 && program_hand == 1) || (player_hand == 1 && program_hand == 2) || (player_hand == 2 && program_hand == 0)
    puts "あなたの勝ちです"
    return :player_win
  elsif player_hand == 3 || program_hand == 3
    puts "戦わないを選択しました。ゲームを終了します。"
    return :quit
  else
    puts "あなたの負けです"
    return :player_lose
  end
end

def acchi_muite_hoi(direction, player_win)
  directions = ["上", "下", "左", "右"]

  if player_win
    puts "あなたはどちらを指しますか？"
  else
    puts "あなたはどちらを向きますか？"
  end

  puts "[0]上\n[1]下\n[2]左\n[3]右"
  player_choice = gets.chomp.to_i

  unless (0..3).include?(player_choice)
    puts "0~3の数字を入力してください"
    return false
  end

  if player_win
    pointing_direction = player_choice
    facing_direction = rand(4)
  else
    pointing_direction = rand(4)
    facing_direction = player_choice
  end

  puts "あっち向いて〜"
  puts "指を差す方向: #{directions[pointing_direction]}"
  puts "顔を向ける方向: #{directions[facing_direction]}"

  if pointing_direction == facing_direction
    if player_win
      puts "あなたの勝ちです"
    else
      puts "あなたの負けです"
    end
    return true
  else
    puts "再戦！"
    return false
  end
end

next_game = true

while next_game
  result = janken
  case result
  when :player_win
    next_game = !acchi_muite_hoi("指", true)
  when :player_lose
    next_game = !acchi_muite_hoi("顔", false)
  when :quit
    next_game = false
  end
end
