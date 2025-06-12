//
//  AddEmailView.swift
//  BabyCarePlus
//
//  Created by Sergio Reina Montes on 03/06/2025.
//

import SwiftUI

struct AddEmailView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(RegisterViewModel.self) private var viewModel
    
    var isButtonEnabled: Bool {
        !viewModel.email.isEmpty
    }
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Añade tu email")
                .font(.title2)
                .bold()
                .padding(.top)
            
            Text("Este email lo usarás para iniciar sesión")
                .font(.footnote)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
            
            TextField("Introduce tu email", text: Binding(get: { viewModel.email}, set: { viewModel.email = $0 }))
                .textInputAutocapitalization(.never)
                .textContentType(.username)
                .modifier(TextFieldModifier())
            
            NavigationLink {
//                self.isLoading = true
                CreateUsernameView()
                    .navigationBarBackButtonHidden(true)
                
                //esperamos 1 segundo para asegurarnos de mostrar animacion al hacer login vaya bien o no
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                            self.viewModel.tryLogin(username: self.user, password: self.password)
//                        }
            } label: {
                Text("Siguiente")
                    .font(.title3)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(12)
            }
            .disabled(!isButtonEnabled)
            .background(isButtonEnabled ? Color.pink : Color.pink.opacity(0.3))
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
    AddEmailView()
        .environment(RegisterViewModel())
}
