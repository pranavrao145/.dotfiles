def cmatrix
  system("cmatrix")
end

def hollywood
  system("hollywood")
end
 
def asciiquarium
  system("asciiquarium")
end

choices = [method(:cmatrix), method(:hollywood), method(:asciiquarium)]

func = choices.sample

func.call
