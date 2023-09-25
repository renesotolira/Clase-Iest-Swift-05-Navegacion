//
//  ContentView.swift
//  Navegacion
//
//  Created by Rene SL on 25/09/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            
            NavigationLink(destination: ItemDetailsView(), label: {
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
