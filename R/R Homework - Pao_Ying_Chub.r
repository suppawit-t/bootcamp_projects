# Homework 02

win <- 0
draw <- 0
lose <- 0
match <- 0
player <- 0

print("Welcome to Pao Ying Chub game!")
print("If you want to stop the game Press Q")

while (player != "Q"){
  ai <- sample(1:3, size = 1, replace = F)
  print("Your turn!")
  print("1.Rock  2.Paper  3.Scissor")
  player <- readLines("stdin", n=1)
  match <- match +1

  # Rock
  if (player == 1 & ai == 1){
    print("Draw")
    draw <- draw + 1
  } else if (player == 1 & ai == 2){
    print("Lose")
    lose <- lose + 1
  } else if (player == 1 & ai == 3){
    print("Win")
    win <- win + 1
  }

  # Paper
  if (player == 2 & ai == 1){
    print("Win")
    win <- win + 1
  } else if (player == 2 & ai == 2){
    print("Draw")
    draw <- draw + 1
  } else if (player == 2 & ai == 3){
    print("Lose")
    lose <- lose + 1
  }

  # Scissor
  if (player == 3 & ai == 1){
    print("Lose")
    lose <- lose + 1
  } else if (player == 3 & ai == 2){
    print("Win")
    win <- win + 1
  } else if (player == 3 & ai == 3){
    print("Draw")
    draw <- draw + 1
  }
}

# Result
print(paste("Total Match:", match-1))
print(paste("Win:  ", win))
print(paste("Draw: ", draw))
print(paste("Lose: ", lose))
