class Game

def initialize(name1, name2)
  player1 = Player.new(name1)
  player2 = Player.new(name2)
  @deck = Deck.new
  @players = [player1, player2]
  @turn = 0
end

  def players
    @players
  end

  def deck
    @deck.deck
  end

  def deal
    first_seven = @deck.deck.slice!(0..6)
    next_seven = @deck.deck.slice!(0..6)
    @players[0].set_hand(first_seven)
    @players[1].set_hand(next_seven)
  end

  def draw_card
    players[@turn].set_hand([@deck.deck.shift])
    puts "#{@deck.deck[-1].value}#{@deck.deck[-1].suit}"
    puts "*-*-*-*"
  end

  def has_card(check_card, player_number)
    players[player_number].hand.find_index {|card| check_card == card.value}
  end

  def check_hand(check_card)
    @counter = 0

    players[@turn ^ 1].hand.each_with_index do |item, index|
      if item.value == check_card
        players[turn].hand << item
        counter += 1
      end
    end
  end

  def counter
    @counter
  end

  def toggle_turn
    @turn ^= 1
  end

  def turn
    @turn
  end
end
