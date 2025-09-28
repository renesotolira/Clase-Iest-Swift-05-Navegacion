//
//  ContentView.swift
//  Navegacion
//
//  Created by Rene SL on 25/09/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            
            NavigationLink(destination: ItemDetailsView(name: "MacBook Air", price: 15689), label: {
               ItemRowView()
            })
            
            NavigationLink(destination: ItemDetailsView(name: "MacBook Pro Usado", price: 3689), label: {
               ItemRowView()
            })
                           
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
