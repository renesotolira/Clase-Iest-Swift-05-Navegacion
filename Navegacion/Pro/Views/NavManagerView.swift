//
//  NavManagerView.swift
//  Navegacion
//
//  Created by rene senoquia on 28/09/25.
//

import SwiftUI

struct NavManagerView: View {
    @StateObject var navMangerVM = NavManagerViewModel()
    @State private var isPresented = false
    @State private var selectedItem: String?
    
    var body: some View {
        
        NavigationStack(path: $navMangerVM.path) {
            HomeView(navMangerVM: navMangerVM,
                     isPresented: $isPresented,
                     selectedItem: $selectedItem)
            .appNavigationDestinations(
                   isPresented: $isPresented,
                   selectedItem: $selectedItem
               )
        }
    }
}

#Preview {
    NavManagerView()
}
