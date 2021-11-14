//
//  ContentView.swift
//  Hello Color
//
//  Created by Nawapon Sangsiri on 14/11/2564 BE.
//

import SwiftUI


func updateContent(){
    
}

struct ContentView: View {
    
    @State private var willMoveToNextScreen = false

    var body: some View {
        NavigationView{
            VStack {
                airplane_pic()
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 250)
                
                CircleImage()
                    .offset(y: -230)
                    .padding(.bottom, -400)
                
                VStack (alignment: .leading){
                    Text("Nawapon Sangsiri")
                        .font(.title)
                    HStack {
                        Text("15 April 2002")
                            .font(.subheadline)
                        Spacer()
                        Text("Thailand")
                            .font(.subheadline)
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                    Divider()

                    NavigationLink(destination: DocumentDetail(document: docTHtoHK)){
                        Text("Thailand to Hong Kong")
                    }
                    
                    Divider()
                    
                    NavigationLink(destination: DocumentDetail(document: docTHtoEN)){
                        Text("Thailand to England")
                    }
                    
                    //DocumentList()
                    
                    Spacer()
                    

                }
                .padding()
                .offset(y:-80)

                NavigationLink(destination:Input1()){
                    Text("Create New Destination")
                }
                
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
