//
//  ContentView.swift
//  QuranSwiftUI
//
//  Created by Dorra Ben Abdelwahed on 27/6/2022.
//

import SwiftUI

struct ListScreenView: View {
    
    let titles = ["Surah","Juz"]
    @StateObject var viewModel = ChapterViewModel()
    @State var selected = 0

    
    var body: some View {
    
        ZStack{
            Color("BG")
                .edgesIgnoringSafeArea(.all)
            
        VStack{
            
            //Title of the screen
            Text("myQuran")
                .fontWeight(.bold)
                .font(.title2)
                .foregroundColor(Color("green"))
                .padding()
            
            //custom Sgmented Control
            SegmentedPickerView(selectedIndex: $selected)
            
            //Custom Search Bar
            SearchBarView(searchText: $viewModel.search)
           
            
            if selected == 0{
            
            //List Views
            List(viewModel.chapters,id: \.id){ chapter in
                NavigationLink(destination: EmptyView()) {
                ListRow(chapter: chapter)
                    .listRowBackground(Color("BG"))
                }
            }
            // Ignore safe area to take up whole screen
            .background(Color("BG").ignoresSafeArea())
            .onAppear {
                // Set the default to clear
                UITableView.appearance().backgroundColor = .clear
                
            }
            
           
            }else {
               
              //get juz data
           
            }
        }
        }.onAppear(perform: viewModel.getData)
            .navigationBarHidden(true)
    }
       
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListScreenView()
    }
}
