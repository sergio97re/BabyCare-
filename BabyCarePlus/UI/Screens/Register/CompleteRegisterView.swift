//
//  CompleteRegisterView.swift
//  BabyCarePlus
//
//  Created by Sergio Reina Montes on 03/06/2025.
//

import SwiftUI

struct CompleteRegisterView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(RegisterViewModel.self) private var viewModel

    var body: some View {
        VStack(spacing: 12) {
            Text("Bienvenido a BabyCarePlus, \(viewModel.username)")
                .font(.title2)
                .bold()
                .padding(.top)
            
            Text("Haz click en el botón para completar el registro")
                .font(.footnote)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
            
            Button {
//                self.isLoading = true
                Task { try await viewModel.createUser() }
                //esperamos 1 segundo para asegurarnos de mostrar animacion al hacer login vaya bien o no
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                            self.viewModel.tryLogin(username: self.user, password: self.password)
//                        }
            } label: {
                Text("Completar registro")
                    .font(.title3)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(12)
            }
            .background(Color.pink)
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .padding(.top, 20)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                HStack {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                    
                    Text("Volver")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                }
                .onTapGesture {
                    dismiss()
                }
            }
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    CompleteRegisterView()
        .environment(RegisterViewModel())
}
