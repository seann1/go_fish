class Player
  @@numerical_value = {"1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9, "10" => 10, "J" => 11, "Q" => 12, "K" => 13, "A" => 14}

  def initialize(name)
    @name = name
    @hand = []
    @points = 0
  end

  def set_hand(cards)
   cards.each {|card| @hand << card}
  end

  def name
    @name
  end

  def hand
    @hand
  end

  def display_hand
    hand.each_with_index do |item, index|
      puts "#{hand[index].value}#{hand[index].suit}"
    end
  end

  def points
    @points
  end

  def hand_sort
    @hand.sort!{|a,b| @@numerical_value[a.value] <=> @@numerical_value[b.value]}
  end

  def remove_4s
    @remove_card = ""
    new_arr = @hand.map{|card| card.value}
    new_arr.each do |card_value|
      if new_arr.count(card_value) == 4
        @remove_card = card_value
      end
    end
    @hand.reject!{|card| card.value == remove_card}
  end

  def points
    @points
  end

  def add_point
    @points += 1
  end

  def remove_card
    @remove_card
  end
end
