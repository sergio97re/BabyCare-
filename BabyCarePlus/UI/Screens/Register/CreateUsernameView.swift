//
//  CreateUsernameView.swift
//  BabyCarePlus
//
//  Created by Sergio Reina Montes on 03/06/2025.
//

import SwiftUI

struct CreateUsernameView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(RegisterViewModel.self) private var viewModel
    
    var isButtonEnabled: Bool {
        !viewModel.username.isEmpty
    }
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Crea tu usuario")
                .font(.title2)
                .bold()
                .padding(.top)
            
            Text("Podrás cambiarlo más adelante")
                .font(.footnote)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
            
            TextField("Introduce tu usuario", text: Binding(get: { viewModel.username}, set: { viewModel.username = $0 }))
                .textInputAutocapitalization(.never)
                .textContentType(.username)
                .modifier(TextFieldModifier())
            
            NavigationLink {
//                self.isLoading = true
                
                CreatePasswordView()
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
    CreateUsernameView()
        .environment(RegisterViewModel())
}
