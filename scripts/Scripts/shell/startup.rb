# Script that runs at terminal startup

# frozen_string_literal: true

def neofetch
  system('neofetch')
end

def ascii_art
  system('figlet cypher | lolcat')
end 

def color_script
  system('colorscript -r')
end

def cypher_art
  system('jp2a ~/Pictures/terminal/cypher --height=25 | lolcat')
end

def cow_art
  system('cowsay "Let\'s get it" | lolcat')
end

# array of functions available
choices = [method(:neofetch), method(:ascii_art), method(:color_script), method(:cypher_art), method(:cow_art)]

# call a a random function
func = choices.sample
func.call
