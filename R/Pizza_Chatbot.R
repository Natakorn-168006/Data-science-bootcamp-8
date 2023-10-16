# Homework 1 , Pizza chatbot



chatbot = function(){
    type = list('hawaiian','cheese','pepperoni')
    price = list(Hawaiian=200,Cheese=100,Pepperoni=150,Other = 250)
    sizes = list(L = 1.2,M = 1,S = 0.8)
    pizza = readline('What pizza you would like? : ')
    pizza = tolower(pizza)
    size = readline('What size you would like? : ')
    vol = as.numeric(readline('How many pizza would like? : '))
    
    if (pizza == 'hawaiian' & size == 'L'){
      print(paste('You must pay',price$Hawaiian*sizes$L*vol,'Baht'))
    }else if (pizza == 'cheese' & size == 'L'){
      print(paste('You must pay',price$Cheese*sizes$L*vol,'Baht'))
    }else if (!(pizza %in% type)){
      print(paste("We don't have",pizza,'Pizza,','We have Hawaiian ,Cheese and Pepperoni'))
    }
}


chatbot()
