# Script that runs at terminal startup

# frozen_string_literal: true

def fastfetch
  system('fastfetch')
end

def pfetch
  system('pfetch')
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

# array of functions available
choices = [method(:fastfetch), method(:color_script)]

# call a a random function
func = choices.sample
func.call
