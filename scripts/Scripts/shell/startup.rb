def neofetch
  system("neofetch")
end

def ascii_art
  system("figlet cypher | lolcat")
end 

def fortune_message
  system("fortune | cowsay | lolcat")
end

def color_script
  system("colorscript -r")
end

choices = [method(:neofetch), method(:ascii_art), method(:fortune_message), method(:color_script)]

func = choices.sample

func.call
