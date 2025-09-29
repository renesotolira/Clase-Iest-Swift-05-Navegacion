//
//  HomeView.swift
//  Navegacion
//
//  Created by rene senoquia on 28/09/25.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var navMangerVM: NavManagerViewModel
       @Binding var isPresented: Bool
       @Binding var selectedItem: String?
    
    var body: some View {
        ScrollView(){
            VStack(spacing: 20) {
                
                Text("Navegacions por tipos de dato en Button")
                
                Button("Nav x Bool") {
                    isPresented = true
                }
                
                //Con botones
                Button("Nav x String") {
                    navMangerVM.goToTexts(value: "Mac Mid 2012")
                }
                
                Button("Nav x Int") {
                    navMangerVM.goToNumbers(value: 2)
                }
                
                Divider()
                
                Text("Por Navigation Links")
                
                //con Navigation Link
                NavigationLink(value: 1) {
                    ItemRowView()
                }
                
                NavigationLink(value: "MacStudio") { //value es el parametro
                    ItemRowView()
                }
                
                Divider()
                
                Text("Por Optionals, valor seleccionado")
                
                Button("Facil") {
                    selectedItem = "Op1"
                }
                Button("Medio") {
                    selectedItem = "Op2"
                }
                Button("Dificl") {
                    selectedItem = "Op3"
                }
                
                Divider()
                
                Text("Con Objetos")
                
                Button("Nav x Enum Params") {
                    navMangerVM.goToDetails(objeto: ItemModel(nombre: "MacBook Pro M5", precio: 99991))
                }
                
            }
        }
    }
}

#Preview {
    HomePreviewWrapper()
}

private struct HomePreviewWrapper: View {
    @StateObject var navMangerVM = NavManagerViewModel()
    @State private var isPresented = false
    @State private var selectedItem: String?
    
    var body: some View {
        HomeView(
            navMangerVM: navMangerVM,
            isPresented: $isPresented,
            selectedItem: $selectedItem
        )
    }
}
