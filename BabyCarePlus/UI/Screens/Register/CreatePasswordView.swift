//
//  CreatePasswordView.swift
//  BabyCarePlus
//
//  Created by Sergio Reina Montes on 03/06/2025.
//

import SwiftUI

struct CreatePasswordView: View {
    @State private var isPasswordVisible: Bool = false
    @Environment(RegisterViewModel.self) private var viewModel
    
    @Environment(\.dismiss) var dismiss
    
    var isButtonEnabled: Bool {
        !viewModel.password.isEmpty
    }
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Crea tu contraseña")
                .font(.title2)
                .bold()
                .padding(.top)
            
            Text("Tu contraseña debe tener al menos 8 letras y un número.")
                .font(.footnote)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
            
            ZStack(alignment: .trailing) {
                ZStack {
                    TextField("Introduce tu contraseña", text: Binding(get: { viewModel.password}, set: { viewModel.password = $0 }))
                        .textInputAutocapitalization(.never)
                        .opacity(isPasswordVisible ? 1 : 0)
                        .disabled(!isPasswordVisible)
                        .autocorrectionDisabled(true)
                        .textContentType(.password)
                    
                    SecureField("Introduce tu contraseña", text: Binding(get: { viewModel.password}, set: { viewModel.password = $0 }))
                        .opacity(isPasswordVisible ? 0 : 1)
                        .disabled(isPasswordVisible)
                        .submitLabel(.go)
                }
                .padding()
                .background(Color.gray.opacity(0.03))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.gray)
                )
                
                Button {
                    isPasswordVisible.toggle()
                } label: {
                    Image(systemName: isPasswordVisible ? "eye" : "eye.slash")
                        .foregroundStyle(Color.gray)
                        .frame(width: 24, height: 24)
                }
                .padding(.trailing)
                
            }
            
            NavigationLink {
//                self.isLoading = true
                
                CompleteRegisterView()
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
    CreatePasswordView()
        .environment(RegisterViewModel())
}
