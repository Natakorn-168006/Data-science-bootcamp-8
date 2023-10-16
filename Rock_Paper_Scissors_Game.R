

play_game = function(){
  
  option = c('rock','paper','scissors')
  computer_score = 0
  player_score = 0
  
  while(T){
    
    player_choice = readline('Your choice:')
    player_choice = tolower(player_choice)
    computer_choice = sample(option,1)
    
    if (player_choice == 'quit'){
      print('Goodbye thanks for playing')
      break
    } else if (!(player_choice %in% option)){
      print('Invalid choice, Try again')
    } else if (player_choice == computer_choice){
      print("It's a tie")
    } else if ((player_choice == 'rock' & computer_choice == 'scissors') ||
              (player_choice == 'paper' & computer_choice == 'rock') ||
              (player_choice == 'scissors' & computer_choice == 'paper')){
                
      print('You win!!!')
      player_score = player_score+1
    } else {
      print('Computer win!!!')
      computer_score = computer_score+1
    }
  }
  cat('Summary score\n')
  cat('Player score:',player_score,'\n')
  cat('Computer score:',computer_score)
}















