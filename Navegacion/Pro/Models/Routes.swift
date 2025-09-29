//
//  Routes.swift
//  Navegacion
//
//  Created by rene senoquia on 28/09/25.
//

import Foundation

enum Routes: Hashable {
    case probarTextos(String)
    case probarNumeros(Int)
    case conParametros(name: String, price: Float)
}
