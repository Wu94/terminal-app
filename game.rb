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
        @player_name = ""
    start_game
    end
    a = Artii::Base.new 
    # prints out current hand and value 
    def print_hands
        puts "#{@player_name}'s hand: #{@player_hand} total value: #{total_hand_value(@player_hand)}".colorize(:yellow)
        puts "Dealer hand: #{@dealer_hand} total value: #{total_hand_value(@dealer_hand)}".colorize(:light_blue)
    end
    puts a.asciify("Welcome to BlackJack").colorize(:green)
    puts "HOW TO PLAY: The objective is to beat the dealer by the player having a higher hand value that is under 21. 
At the start, you will be dealt a hand and the player will have a choice to hit which draws a new card into 
player hand or stand which will start the dealers turn to try to beat your hand"
puts 
    # atarts game and player actions 
    def start_game 
        get_player_name
        user_input = ""
        while user_input != "Stand"
            print_hands
            if total_hand_value(@player_hand) > 21 
                puts "#{@player_name} busts, better luck next time".colorize(:red)
                puts "Please play again :)".colorize(:yellow)
                return
            end
            user_input = @prompt.select "Would you like to", ["Hit", "Stand"]
            if user_input.downcase == "hit"
                hit(@player_hand)
            elsif user_input.downcase == "stand"
                puts "#{@player_name} stands, Dealers turn"
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
            puts "Play again to WIN more?".colorize(:yellow)
        elsif total_hand_value(@player_hand) == total_hand_value(@dealer_hand)
            puts "THIS NEVER HAPPENS, ITS A TIE!".colorize(:green)
            puts "No one lost, play again?".colorize(:yellow)
        elsif total_hand_value(@player_hand) > total_hand_value(@dealer_hand)
            puts "Congrantulations, Player WINS!".colorize(:green)
            puts "Play again to WIN more?".colorize(:yellow)
        elsif total_hand_value(@player_hand) < total_hand_value(@dealer_hand)
            puts "Dealer WINS!, Unlucky :(".colorize(:red)
            puts "Please play again :)".colorize(:yellow)
        else     
        end
    end
    # allows user to name the player 
    def get_player_name
        @player_name = @prompt.ask('What is your name?')  
        until @player_name.match(/^[a-zA-Z\d\s]*$/)
          puts "Your name can't have symbols, please try again"
          @player_name = @prompt.ask('What is your name?')
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