//
//  NavManagerViewModel.swift
//  Navegacion
//
//  Created by rene senoquia on 28/09/25.
//

import Foundation
import SwiftUI

class NavManagerViewModel: ObservableObject{
    @Published var path = NavigationPath()
    
    func goToTexts(value: String){
        path.append(Routes.probarTextos(value))
    }
    
    func goToNumbers(value: Int){
        path.append(Routes.probarNumeros(value))
    }
    
    func goToDetails(objeto: ItemModel){
        path.append(Routes.conParametros(name: objeto.nombre, price: objeto.precio))
    }
}
