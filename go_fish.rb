require './lib/game'
require './lib/player'
require './lib/card'
require './lib/deck'

def main_menu
  puts "Enter Player 1 name"
  player1 = gets.chomp
  puts "Enter Player 2 name"
  player2 = gets.chomp

  new_game = Game.new(player1, player2)
  new_game.deal
  while new_game.deck.length > 0
    new_game.players[new_game.turn].display_hand
    puts "Ask player"
    asked_for_card = gets.chomp
    if asked_for_card == 'exit'
      exit
    end

    if new_game.has_card(asked_for_card, new_game.turn) == nil
      puts "please ask for a valid card"
    else
      new_game.check_hand(asked_for_card)

    if new_game.counter == 0
        puts "Draw a card"
    else
        puts "go again"
        new_game.check_hand(asked_for_card)
    end
      new_game.toggle_turn
    end
  end


end
main_menu
