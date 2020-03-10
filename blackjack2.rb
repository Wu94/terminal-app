# number = ["A", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
# symbol = ["h", "d", "s", "c"]

class Card

    value_card = { "Ah" => 11, "Ad" => 11, "As" => 11, "Ac" => 11,
    "Kh" => 10, "Kd" => 10, "Ks" => 10, "Kc" => 10,
     "Qh" => 10, "Qd" => 10, "Qs" => 10, "Qc" => 10,
      "Jh" => 10, "Jd" => 10, "Js" => 10,"Jc" => 10,
       "9h" => 9, "9d" => 9, "9s" => 9, "9c" => 9, 
       "8h" => 8, "8d" => 8, "8s" => 8, "8c" => 8, 
       "7h" => 7, "7d" => 7, "7s" => 7, "7c" => 7, 
       "6h" => 6, "6d" => 6, "6s" => 6, "6c" => 6, 
       "5h" => 5, "5d" => 5, "5s" => 5, "5c" => 5, 
       "4h" => 4, "4d" => 4, "4s" => 4, "4c" => 4, 
       "3h" => 3, "3d" => 3, "3s" => 3, "3c" => 3, 
       "2h" => 2, "2d" => 2, "2s" => 2, "2c" => 2 }

    attr_accessor :number, :symbol

    def initialize(number, symbol)
        @number = number
        @symbol = symbol
        @value = value_card
    end

    def card_output 
        puts "#{@number} of #{@symbol}"
    end

end

class Deck
    def initialize 
        @number = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
        @symbol = ["h", "d", "s", "c"] 
        @cards = []
    
        @number.each do |number|
        @symbol.each do |symbol|
        @cards << Card.new(number, symbol) 
    end
    end 
    @cards.shuffle!
    end

    def deal (num)
        num.times {@cards.shift.card_output}
    end
end

deck = Deck.new
puts deck.deal(10)
class Dealer 
end
class Player1
end
