# Homework 01
# Chatbot (Rule-based)
# Ordering pizza
# 8-10 dialogues

print("Welcome to Hawaii Pizza!")

# Q1 Ask Name
print("What is your name?")
user_name <- readLines("stdin", n=1)

# Q2 Choose Pizza Topping
print(paste("Hi!",user_name,"what do you want to order today?"))
print("1.Seafood Cocktail 2.Hawaiian 3.Double Pepperoni 4.Aloha")
order <- readLines("stdin", n=1)
price <- 0

if (order == 1) {
  order <- "Seafood Cocktail"
  price <- price + 279
} else if (order == 2){
  order <- "Hawaiian"
  price <- price + 219
} else if (order == 3){
  order <- "Double Pepperoni"
  price <- price + 199
} else if (order == 4){
  order <- "Aloha"
  price <- price + 199
}
print(paste("Your order is", order))

# Q3 Choose Crust
print("Next, please choose your Crust")
print("1.Pan 2.Cheese Crust 3.Crispy Thin")
crust <- readLines("stdin", n=1)

if (crust == 1){
  crust <- "Pan"
  price <- price +0
} else if (crust == 2){
  crust <- "Cheese Crust"
  price <- price +50
} else if (crust == 3){
  crust <- "Crispy Thin"
  price <- price -50
}

# Q4 Choose Sizing
print("What size pizza do you want?")
print("1.S 2.M 3.L")
size <- readLines("stdin", n=1)

if (size == 1){
  size <- "size S"
  price <- price + 0
} else if (size == 2) {
  size <- "size M"
  price <- price + 130
} else if (size == 3) {
  size <- "size L"
  price <- price + 200
}
print(paste("You choose pizza:",order,crust,size))
print(paste("Total balance:",price,"Baht"))

# Q5 Add-on
print("Do you want to add Appetizer?")
print("1.Yes 2.No") 
app <- readLines("stdin", n=1)

if (app == 1){
  print("What do you want?")
  print("1.Chicken Wings 2.Pasta 3.Garlic Bread")
  appe <- readLines("stdin", n=1)

  if (appe == 1){
    appe <- "Chick Wings"
    price <- price + 109
  } else if (appe == 2){
    appe <- "Pasta"
    price <- price + 129
  } else if (appe == 3){
    appe <- "Garlic Bread"
    price <- price + 69
  }
} else if (app == 2){
  appe <- "-"
}

# Q6 Drink
print("Do you want some drink?")
print("1.Yes 2.No")
drink <- readLines("stdin", n=1)

if (drink == 1){
  print("What do you want?")
  print("1.Water 2.Coke 3.Tea")
  drink <- readLines("stdin", n=1)

  if (drink == 1){
    drink <- "Water"
    price <- price +20
  } else if (drink == 2){
    drink <- "Coke"
    price <- price +35
  } else if (drink == 3){
    drink <- "Tea"
    price <- price +25
  }
} else if (drink == 2){
  drink <- "-"
}

# Q7 Confirm Order
print("============ Total Order ============")
print(paste("You choose pizza:  ",order,crust,size))
print(paste("+ Add on Appetizer:", appe))
print(paste("+ Drink:           ", drink))
print(paste("Total balance:     ",price,"Baht"))
print("=====================================")

# Q8 Membership
print("Do you have Membership?")
print("1.Yes 2.No")
member <- readLines("stdin", n=1)

if (member == 1){
  price <- price*0.9
  print("You get discount 10%")
} 

print(paste("Total Balance:",price,"Baht"))
