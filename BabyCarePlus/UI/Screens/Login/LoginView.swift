//
//  LoginView.swift
//  BabyCarePlus
//
//  Created by Sergio Reina Montes on 08/05/2025.
//

import SwiftUI

struct LoginView: View {
    
    @State private var viewModel = LoginViewModel()
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var isLoading: Bool = false
    
    var isButtonEnabled: Bool {
        !email.isEmpty && !password.isEmpty
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("logoApp")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding(.top, 100)
                
                VStack(spacing: 16) {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Email")
                            .font(.custom("Nunito Sans 12pt ExtraLight 12pt Regular", size: 18, relativeTo: .title3))
                            .foregroundStyle(.black.opacity(0.6))
                        
                        TextField("Introduce tu usuario", text: $email)
                            .textInputAutocapitalization(.never)
                            .textContentType(.username)
                            .submitLabel(.next)
                            .modifier(TextFieldModifier())
                    }
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Contraseña")
                            .font(.custom("Nunito Sans 12pt ExtraLight 12pt Regular", size: 18, relativeTo: .title3))
                            .foregroundStyle(.black.opacity(0.6))
                        
                        ZStack(alignment: .trailing) {
                            ZStack {
                                TextField("Introduce tu contraseña", text: $password)
                                    .textInputAutocapitalization(.never)
                                    .opacity(isPasswordVisible ? 1 : 0)
                                    .disabled(!isPasswordVisible)
                                    .autocorrectionDisabled(true)
                                    .textContentType(.password)
                                
                                SecureField("Introduce tu contraseña", text: $password)
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
                    }
                    
                    Button {
                        //Recuperar contraseña
                    } label: {
                        Text("¿Olvidaste tu contraseña?")
                            .font(.custom("Nunito Sans 12pt ExtraLight 12pt Bold", size: 16, relativeTo: .title3))
                            .foregroundStyle(.gray)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    Button {
                        self.isLoading = true
                        viewModel.signIn()
                        
                        //esperamos 1 segundo para asegurarnos de mostrar animacion al hacer login vaya bien o no
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                            self.viewModel.tryLogin(username: self.user, password: self.password)
//                        }
                    } label: {
                        Text(isLoading ? "Entrando..." : "Acceder")
                            .font(.title3)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                    }
                    .disabled(!isButtonEnabled)
                    .background(isButtonEnabled ? Color.pink : Color.pink.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    .padding(.top, 30)
                    
                    Spacer()
                    
                    NavigationLink {
                        AddEmailView()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Text("Me quiero registrar")
                            .font(.custom("Nunito Sans 12pt ExtraLight 12pt Bold", size: 16, relativeTo: .title3))
                            .foregroundStyle(.gray)
                    }
                    
//                    HStack {
//                        Text("Powered by ")
//                            .font(.custom("Nunito Sans 12pt ExtraLight 12pt Regular", size: 18, relativeTo: .title3))
//                        +
//                        Text("ElevatiApp")
//                            .font(.custom("Nunito Sans 12pt ExtraLight 12pt SemiBold", size: 18, relativeTo: .title3))
//                        
//                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    LoginView()
}
