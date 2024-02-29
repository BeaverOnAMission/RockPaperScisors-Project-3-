//
//  MultiPlayerView.swift
//  RockPaperScisors(project 3)
//
//  Created by mac on 12.08.2022.
//


import SwiftUI
struct ImageView2: View {
   var image: Image
    var body: some View {
        
            image
           .resizable()
           .frame(width:200, height:200)
           .cornerRadius( 10 )
           .shadow(color: Color("Color-2"), radius: 3)
        
    }
}
struct ImageView3: View {
   var image: Image
    var body: some View {
        
            image
           .resizable()
           .frame(width:200, height:200)
           .cornerRadius( 10 )
           .shadow(color: Color("Color-3"), radius: 3)
        
    }
}
struct MultiPlayerView: View {
        @State private var showContentView = false
        @State private var showSecondPlayerView = false
        @State var choices = ["Rock", "Papper", "Scissors"]
        @State private var showingScore = false
        @State private var showingalert = false
        @State private var scoreTitle = ""
        @State private var FirstPlayerScore = 0
        @State private var SecondPlayerScore = 0
        @State private var score = "Score:"
        @State var FirstPlayer = 0
    
        var body: some View {
            
            if showSecondPlayerView == false {
                
            ZStack{
                
                    VStack {
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        HStack{
                            Text ("FIRST          PLAYER TURN:")
                                .foregroundColor(Color("Color-2"))
                                .font(.title.bold())
                                .padding(20)
                            Spacer()
                            
                        Button (action: {
                           
                            showContentView = true
                           
                        }, label: {
                            Image(systemName: "house.circle")
                                .resizable()
                                .foregroundColor(Color("Color-2"))
                                .frame(width: 35, height: 35)
                                .padding(20)
                                }
                            )
                            
                        }
                        
                       Spacer()
                        Group{
                        Text ("Pick your fighter:")
                            .font(.largeTitle.weight(.heavy))
                            .foregroundStyle(Color("Color-2"))
                      
                        
                            HStack{

                                Button{
                                    
                                    FirstPlayer = 2
                                    showSecondPlayerView.toggle()
                                  
                                }
                                label:  {
                                ImageView2(image: Image(choices[2]))

                                }
                                Button{
                        
                                    FirstPlayer = 1
                                    showSecondPlayerView.toggle()
                               
                                }
                                label:  {
                                    ImageView2(image: Image(choices[1]))
                    
                                }
                                    }
                            Button{
                        
                                FirstPlayer = 0
                                showSecondPlayerView.toggle()
                                
                            }
                            label:  {
                                ImageView2(image: Image(choices[0]))
                    
                                }
                            Spacer()
                        
                       Text("\(FirstPlayerScore) : \(SecondPlayerScore)")
                            .foregroundColor(Color("Color-2"))
                            .font(.system(size: 60).bold())
                            .padding(20)
                        
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                        }
                        
                        Spacer()
                        
                    }.frame(width: UIScreen.main.bounds.width, height: 1500)
                .background(Color("Color"))
               
                if self.showContentView {
                    
                          ContentView()
                        
                    }
            }
            }
            
            else{
                
            ZStack{
                
                    VStack {
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        HStack{
                            Text ("SECOND PLAYER TURN:")
                                .foregroundColor(Color("Color-3"))
                                .font(.title.bold())
                                .padding(20)
                            Spacer()
                            
                        Button (action: {
                           
                            showContentView = true
                           
                        }, label: {
                            Image(systemName: "house.circle")
                                .resizable()
                                .foregroundColor(Color("Color-3"))
                                .frame(width: 35, height: 35)
                                .padding(20)
                                }
                            )
                            
                        }
                        
                       Spacer()
                        
                        Group{
                        
                        Text ("Pick your fighter:")
                            .font(.largeTitle.weight(.heavy))
                            .foregroundStyle(Color("Color-3"))
                      
                        
                            HStack{

                                Button{
                                    
                                    tapped(2)
                                   
                                }
                                label:  {
                                ImageView3(image: Image(choices[2]))

                                }
                                Button{
                        
                                    tapped(1)
                                    
                                }
                                label:  {
                                    ImageView3(image: Image(choices[1]))
                    
                                }
                                    }
                            Button{
                        
                                tapped(0)
                               
                            }
                            label:  {
                                ImageView3(image: Image(choices[0]))
                    
                                }
                            Spacer()
                        
                            
                        Text("\(FirstPlayerScore) : \(SecondPlayerScore)")
                            .foregroundColor(Color("Color-3"))
                            .font(.system(size: 60).bold())
                            .padding(20)
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                    
                    Spacer()
                    }.frame(width: UIScreen.main.bounds.width, height: 1500)
                .background(Color("Color"))
                if self.showContentView {
                    
                          ContentView()
                        
                    }
               
            }
            
            
                
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: nextRound)
                
            }
            message: {
                Text("Score: \(FirstPlayerScore) : \(SecondPlayerScore)")
            }
            .alert("GAME OVER", isPresented: $showingalert){
                Button("Restart", action: alert)
                
            }
            message: {
                Text("your FINAL score is: \(FirstPlayerScore) : \(SecondPlayerScore)")
            }
            }
        }
        
        
        
        func tapped(_ SecondPlayer : Int) {
            if FirstPlayerScore < 3 && SecondPlayerScore < 3 {
                
            
            if SecondPlayer == 0 {
                if   FirstPlayer == 2 {
                
                scoreTitle = "Second player won with \(choices[0])"
                    SecondPlayerScore+=1
                }
             else if  FirstPlayer == 1 {
                scoreTitle = "First player won with \(choices[1])"
                 FirstPlayerScore+=1
            }
                else {
                    scoreTitle = "Draw"
                }
            }
            
       
            else if SecondPlayer == 1 {
                if  FirstPlayer == 0 {
                
                scoreTitle = "Second player won with \(choices[1])"
                    SecondPlayerScore+=1
                }
             else if  FirstPlayer == 2 {
                scoreTitle = "First player won with \(choices[2])"
                 FirstPlayerScore+=1
            }
                else {
                    scoreTitle = "Draw"
                }
            }
                else if SecondPlayer == 2 {
                    if  FirstPlayer == 1 {
                    
                    scoreTitle = "Second player won with \(choices[2])"
                        SecondPlayerScore+=1
                    }
                 else if  FirstPlayer == 0 {
                    scoreTitle = "First player won with \(choices[0])"
                     FirstPlayerScore+=1
                }
                    else {
                        scoreTitle = "Draw"
                    }
                }
            }
         
            else  {
            score="Score: \(FirstPlayerScore) : \(SecondPlayerScore)"
              
        showingalert.toggle()
               
            }
            score="Score: \(FirstPlayerScore) : \(SecondPlayerScore)"
            showingScore = true
        }
        func nextRound (){
            if FirstPlayerScore < 3 && SecondPlayerScore < 3 {
            showSecondPlayerView.toggle()
            }
            else {
                showingalert.toggle()
            }
        }
        func alert (){
            FirstPlayerScore = 0
            SecondPlayerScore = 0
            score=""
            showingScore=false
            showSecondPlayerView.toggle()

        }
    }

struct MultiPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        MultiPlayerView()
    }
}

