//
//  NavExtension.swift
//  Navegacion
//
//  Created by rene senoquia on 28/09/25.
//

import Foundation
import SwiftUI

extension View {
    func appNavigationDestinations(
        isPresented: Binding<Bool>,
        selectedItem: Binding<String?>
    ) -> some View {
        self
            .navigationDestination(isPresented: isPresented) {
                ItemRowView()
            }
            .navigationDestination(item: selectedItem) { item in
                Text("Op seleccionada fue \(item)")
            }
            .navigationDestination(for: Routes.self) { ruta in
                switch ruta {
                case .probarNumeros(let num):
                    Text("Ruta numérica es \(num)")
                case .probarTextos(let texto):
                    Text("Ruta string es \(texto)")
                case .conParametros(let nombre, let precio):
                    ItemDetailsView(name: nombre, price: precio)
                }
            }
            .navigationDestination(for: String.self) { value in
                //Text("Recibe texto \(value)")
                ItemDetailsView(name: value, price: 15689) //Vista destino
            }
            .navigationDestination(for: Int.self) { value in
                Text("Número es \(value)")
            }
          
    }
}
