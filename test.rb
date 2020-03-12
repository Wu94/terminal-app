require 'figlet'

font = Figlet::Font.new('big.flf')

figlet = Figlet::Typesetter.new(font)
 
puts figlet['hello world']