//
//  RootView.swift
//  BabyCarePlus
//
//  Created by Sergio Reina Montes on 08/05/2025.
//

import SwiftUI

struct RootView: View {
    @State var viewModel = RootViewModel()
    @State var registerViewModel = RegisterViewModel()
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
                    .environment(registerViewModel)
            }else {
                MainTabView()
            }
        }
    }
}

#Preview {
    RootView()
}
