require 'deck'
require 'card'
require 'game'
require 'player'
require 'rspec'

describe 'Game' do
  it 'initializes a new instance of game' do
    new_game = Game.new('dylan', 'sean')
    expect(new_game).to be_an_instance_of Game
  end

  it 'creates a new player object in game' do
    new_player = Player.new('dylan')
    expect(new_player).to be_an_instance_of Player
  end

  it "puts 7 cards into each player's hand" do
    new_game = Game.new('dylan', 'sean')
    new_game.deal
    expect(new_game.players[0].hand.length).to eq 7
  end

  it 'lets the player draw a single card' do
    new_game = Game.new('sean', 'dylan')
    new_game.deal
    new_game.draw_card
    expect(new_game.players[0].hand.length).to eq 8
  end
end
describe 'Player' do
  it 'creates a new player' do
    new_player = Player.new('dylan')
    expect(new_player.name).to eq 'dylan'
  end
  it 'gives the player a hand of 7 cards' do
    new_player = Player.new('dylan')
    new_deck = Deck.new
    new_player.hand << new_deck.deck.shift(7)
    expect(new_player.hand.flatten.length).to eq 7
  end
end

describe 'Deck' do
  it 'creates a deck' do
    new_deck = Deck.new
    expect(new_deck).to be_an_instance_of Deck
  end

  it 'creates a deck' do
    new_deck = Deck.new
    expect(new_deck.deck.length).to eq 52
  end
end
