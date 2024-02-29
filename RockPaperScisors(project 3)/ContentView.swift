//
//  ContentView.swift
//  RockPaperScisors(project 3)
//
//  Created by mac on 07.08.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var showSinglePlayerView = false
    @State private var showMultiPlayerView = false
    var body: some View {
        ZStack{
            
        VStack{
                
            Spacer()
            Spacer()
            
            Text("THE ROCK, paper, scisors")
                .font(.largeTitle.bold())
                .foregroundColor(Color("Color-2"))
                
                Spacer()
                
            Button (action: {
                showSinglePlayerView = true
            }, label: {
                Text("Single player")
                    .padding(35)
                    .font(.title.weight(.bold))
                    .foregroundColor(Color("Color"))
                    .frame(maxWidth: .infinity)
                    .background(Color("Color-1"))
                    .mask(
                        RoundedRectangle(cornerRadius: 20)
                    )
                    .padding(40)

            }
        )
        
            Button (action: {
                showMultiPlayerView = true
            }, label: {
                Text("Multi player")
                    .padding(35)
                    .font(.title.weight(.bold))
                    .foregroundColor(Color("Color"))
                    .frame(maxWidth: .infinity)
                    .background(Color("Color-1"))
                    .mask(
                        RoundedRectangle(cornerRadius: 20)
                    )
                    .padding(40)

            }
        )
            
            Spacer()
            Spacer()
            Spacer()
            
        }.background(Color("Color"))
            .ignoresSafeArea()
       
            if self.showSinglePlayerView {
                ZStack{
                    
                  SinglePlayerView()
                   
                }
            }
            if self.showMultiPlayerView {
                
                 MultiPlayerView()
                
                }
        }
        
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
