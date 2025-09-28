//
//  NavAvanzado.swift
//  Navegacion
//
//  Created by rene senoquia on 28/09/25.
//

import SwiftUI

enum MisRutas: Hashable {
    case probarTextos(String)
    case probarNumeros(Int)
    case conParametros(name: String, price: Float)
}

struct NavAvanzado: View {
    @State private var path = NavigationPath()
    @State private var isPresented = false
    @State private var selectedItem: String?
    
    var body: some View {
        
        NavigationStack(path: $path) {
            ScrollView(){
                VStack(spacing: 20) {
                    
                    Text("Navegacions por tipos de dato en Button")
                    
                    Button("Nav x Bool") {
                        isPresented = true
                    }
                    
                    //Con botones
                    Button("Nav x String") { //Go to Details es el label
                        path.append("Mac Mid 2012")//append es el parametro a pasar
                    }
                    
                    Button("Nav x Int") { //Go to Details es el label
                        path.append(2)//append es el parametro a pasar
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
                    
                    Text("Con Enums")
                    Button("Nav x Enum String") {
                        path.append(MisRutas.probarTextos("A"))
                    }
                    Button("Nav x Enum Int") {
                        path.append(MisRutas.probarNumeros(1))
                    }
                    Button("Nav x Enum Params") {
                        path.append(MisRutas.conParametros(name: "MacBook Pro M4", price: 99999))
                    }
                    
                }
                
            }
            .navigationDestination(for: String.self) { value in
                //Text("Recibe texto \(value)")
                ItemDetailsView(name: value, price: 15689) //Vista destino
            }
            .navigationDestination(for: Int.self) { value in
                Text("Número es \(value)")
            }
            .navigationDestination(isPresented: $isPresented) {
                ItemRowView()
            }
            .navigationDestination(item: $selectedItem) { item in
                //solo en iOS 17 se puede navegar por item
                Text("Op seleccionada fue \(item)")
            }.navigationDestination(for: MisRutas.self) { ruta in
                switch ruta{
                case .probarNumeros(let num):
                    Text("Ruta numerica es \(num)")
                case .probarTextos(let texto):
                    Text("Ruta string es \(texto)")
                case .conParametros(name: let nombre, price: let precio):
                    ItemDetailsView(name: nombre, price: precio)
                }
                
            }
            
        }
    }
}

#Preview {
    NavAvanzado()
}
