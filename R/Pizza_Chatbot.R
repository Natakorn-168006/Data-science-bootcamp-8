
chatbot = function(){
  cat('welcome to datarockie pizza\n')
  cat('\n','This is our menu\n')
  
  menu = data.frame(
    id_item = c(1,2,3),
    pizza_name = c('hawaiian','cheese','pepperoni'),
    price = c(200,100,150)
  )
  print(menu)
  
  while(T){

    choose_id_item=readline('You can select Pizza ID:')
    name_product=menu$pizza_name[menu$id_item == choose_id_item]
    price_product=menu$price[menu$id_item == choose_id_item]
    
    if (choose_id_item %in% menu[menu$id_item,c('id_item')]){
      print(paste("Okay, you choose Which size", name_product,"pizza do you want?"))
      break
    } else {
      print("Please order again,we don't have pizza that you like")
    }
    
  }
  
  while(T){
    
    pizza_size = data.frame(
    size = c('L','M','S'),
    price_size = c(100,50,0)
  )
    print(pizza_size)
    choose_size = toupper(readline('Pizza size:'))
    
    if(choose_size %in% pizza_size$size){
      pay = price_product+pizza_size$price_size[pizza_size$size==choose_size]
      break
    }else{
      print('Please order again')
    }
    
  }
  
  cat("Total payments:",pay,'Baht\n')
  cat('Thank you')
  
}
chatbot()
