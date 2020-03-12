#gems
require 'colorize'
require 'tty-prompt'
require 'artii'
#simple blackjack game 
class BlackJack 
    def initialize  
        @deck = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11, 
                2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11, 
                2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11, 
                2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11]
        @player_hand = deal 
        @dealer_hand = deal
        @prompt = TTY::Prompt.new
    start_game
    end
    a = Artii::Base.new 
    # prints out current hand and value 
    def print_hands
        puts "player hand: #{@player_hand} total value: #{total_hand_value(@player_hand)}".colorize(:yellow)
        puts "Dealer hand: #{@dealer_hand} total value: #{total_hand_value(@dealer_hand)}".colorize(:light_blue)
    end
    puts a.asciify("Welcome to BlackJack").colorize(:green)
    # atarts game and player actions 
    def start_game 
        user_input = false
        while user_input != @prompt.select("stand")
            print_hands
            @prompt.select("Would you like to", %w(Hit, Stand)).colorize(:black ).colorize( :background => :white)
            print_hands
            if total_hand_value(@player_hand) > 21 
                puts "Player busts, better luck next time".colorize(:light_red)
                puts "Please play again :)"
                return
            end
            if user_input.downcase == "hit"
                hit(@player_hand)
            elsif user_input.downcase == "stand"
                puts "Player stands, Dealers turn"
            else
                puts "Something went wrong here, please try hit or stand".colorize(:red)
            end
        end
        dealers_turn
        game_conditions 
    end
    # dealers actions 
    def dealers_turn
        while total_hand_value(@dealer_hand) < 17 
            puts "Dealer Hits"
            hit(@dealer_hand)
        end
    end
    # lose and win conditions of blackjack
    def game_conditions 
        print_hands
        if total_hand_value(@dealer_hand) > 21
            puts "Dealer Busts, Congrantulations you WIN!".colorize(:green)
            puts "Play again to WIN more?"
        elsif total_hand_value(@player_hand) == total_hand_value(@dealer_hand)
            puts "THIS NEVER HAPPENS ITS A TIE!".colorize(:green)
            puts "No one lost, play again?"
        elsif total_hand_value(@player_hand) > total_hand_value(@dealer_hand)
            puts "Congrantulations, Player WINS!".colorize(:green)
            puts "Play again to WIN more?"
        elsif total_hand_value(@player_hand) < total_hand_value(@dealer_hand)
            puts "Dealer WINS!, Unlucky :(".colorize(:light_red)
            puts "Please play again :)"
        else
            
        end
    end
    # draws random card from deck that hasnt been dealt     
    def hit (hand)
        hand.push(get_random_card)
    end
    # deals first two cards when game has started 
    def deal
        [get_random_card, get_random_card]
    end
    # calculates the value of players or dealers hand  
    def total_hand_value(hand)
        sum = 0 
        hand.each do |card|
        sum = sum + card
        end 
        sum 
    end
    # deals rendom cards from the deck 
    def get_random_card 
        @deck[rand(@deck.length)]
    end
end

BlackJack.new 

#improvements 
# if player or dealer hand was dealt or equals to 21 game stops  
# make condition if value of hand is 21 puts BLACKJACK!
# have jack, queen, king instead of three 10s 
# have A card to have value of 11 or 1 depending if player busts 
# give cards suits to represent a deck of 52 cards as atm dry priciple has been breached 
# gems colorzie and tty prompt 