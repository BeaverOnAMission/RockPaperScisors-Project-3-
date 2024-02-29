//
//  SinglePlayerView.swift
//  RockPaperScisors(project 3)
//
//  Created by mac on 07.08.2022.
//


import SwiftUI
struct ImageView: View {
   var image: Image
    var body: some View {
        
            image
           .resizable()
           .frame(width:200, height:200)
           .cornerRadius( 10 )
           .shadow(color: Color("Color-1"), radius: 3)
        
    }
}
struct SinglePlayerView: View {
    @State private var showContentView = false
  @State var choices = ["Rock", "Papper", "Scissors"]
 @State var randomAnswer = Int.random(in: 1...2)
    @State private var showingScore = false
    @State private var showingalert = false
    @State private var scoreTitle = ""
    @State private var correctscore = 0
    @State private var wrongscore = 0
    @State private var score = "Score:"
    var body: some View {
        ZStack{
            
                VStack {
                    
                    Spacer()
                    Spacer()
                    Group{
                    Spacer()
                    HStack{
                         Text (score)
                            .foregroundColor(Color("Color-1"))
                            .font(.title.bold())
                            .padding(20)
                        Spacer()
                        
                    Button (action: {
                       
                        showContentView = true
                       
                    }, label: {
                        Image(systemName: "house.circle")
                            .resizable()
                            .foregroundColor(Color("Color-1"))
                            .frame(width: 35, height: 35)
                            .padding(20)
                            }
                        )
                        
                    }
                    
                   Spacer()
                    
                    Text ("Pick your fighter:")
                        .font(.largeTitle.weight(.heavy))
                        .foregroundStyle(Color("Color-1"))
                  
                    
                        HStack{

                            Button{
   
                                tapped(2)
                            }
                            label:  {
                            ImageView(image: Image(choices[2]))

                            }
                            Button{
                    
                                tapped(1)
                            }
                            label:  {
                                ImageView(image: Image(choices[1]))
                
                            }
                                }
                        Button{
                    
                            tapped(0)
                        }
                        label:  {
                            ImageView(image: Image(choices[0]))
                
                            }
                        Spacer()
                    }
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                    
                    
                }.frame(width: UIScreen.main.bounds.width, height: 1500)
            .background(Color("Color"))
            if self.showContentView {
                
                      ContentView()
                    
                }
        }
            

                     

        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
            
        }
        message: {
            Text("Score: \(correctscore)")
        }
        .alert("GAME OVER", isPresented: $showingalert){
            Button("Restart", action: alert)
            
        }
        message: {
            Text("your FINAL score: \(correctscore)")
        }
       
    }
    
    
    
    func tapped(_ number : Int) {
        if (correctscore+wrongscore)<5{
            
        
        if number == 0 {
            if randomAnswer == 2 {
            
            scoreTitle = "You defeated \(choices[2])"
            correctscore+=1
            }
         else if randomAnswer == 1 {
            scoreTitle = "You lost to a \(choices[1])"
        wrongscore+=1
        }
            else {
                scoreTitle = "Draw"
            }
        }
        
   
        else if number == 1 {
            if randomAnswer == 0 {
            
            scoreTitle = "You defeated \(choices[0])"
            correctscore+=1
            }
         else if randomAnswer == 2 {
            scoreTitle = "You lost to a \(choices[2])"
        wrongscore+=1
        }
            else {
                scoreTitle = "Draw"
            }
        }
            else if number == 2 {
                if randomAnswer == 1 {
                
                scoreTitle = "You defeated \(choices[1])"
                correctscore+=1
                }
             else if randomAnswer == 0 {
                scoreTitle = "You lost to a \(choices[0])"
            wrongscore+=1
            }
                else {
                    scoreTitle = "Draw"
                }
            }
        }
        
        else {
        score="Score: \(correctscore)"
          
    showingalert.toggle()
           
        }
        score="Score: \(correctscore)"
          showingScore = true
    }
    func askQuestion (){
      
        randomAnswer = Int.random(in:0...2)
        
    
    }
    func alert (){
        randomAnswer = Int.random(in:0...2)
        correctscore = 0
        wrongscore = 0
        score="Score:"
        
    }
}
struct singlePlayerView_Previews: PreviewProvider {
    static var previews: some View {
        SinglePlayerView()
    }
}
   

