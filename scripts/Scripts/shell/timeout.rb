# Runs when the terminal is idle for 120 seconds

# frozen_string_literal: true

def cmatrix
  system('cmatrix')
end

def asciiquarium
  system('asciiquarium')
end

# array of functions available
choices = [method(:cmatrix), method(:asciiquarium)]

# call a a random function
func = choices.sample
func.call
