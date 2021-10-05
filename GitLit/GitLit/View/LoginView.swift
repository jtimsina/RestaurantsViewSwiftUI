//
//  Login.swift
//  GitLit
//
//  Created by Jai TImsina on 9/21/21.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    
    @Binding var presentMainScreen: Bool
    @Binding var presentRegScreen: Bool
    
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack{
                ColorBar()
                Text("Welcome")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .kerning(1.9)
                    .frame(
                        width: geometry.size.width,
                        alignment: .center)
                    .padding(.top, 25)
                
                VStack {
                    HStack{
                        Text("User Name")
                            .font(.system(size: 20))
                            .kerning(1.2)
                            .padding(.leading,10)
                        TextField("sample@email.com", text: $email)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            
                            .padding(.leading,5)
                            .background(Color(.secondarySystemBackground))
                    }
                    
                    HStack {
                        Text ("Password")
                            .font(.system(size: 20))
                            .kerning(1.2)
                            .padding(.leading,10)
                        
                        TextField("samplepassword", text: $password)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            
                            .padding(.leading,5)
                            .background(Color(.secondarySystemBackground))
                    }
                    
                    HStack {
                        // Sign Up
                        Button(action: {
                            presentRegScreen = true
                        }, label: {
                            ZStack{
                                Text(" Sign up ")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                            }.background(Color.blue)
                            .opacity(1)
                        })
                        .frame(maxWidth: geometry.size.width, alignment: .leading)
                        .padding (.leading, 30)
                        
                        // Sign In
                        Button(action: {
                            
                            guard !email.isEmpty, !password.isEmpty else {
                                return
                            }
                            
                            viewModel.signIn(email: email, password: password)
                            
                            if viewModel.signedIn == true{
                                presentMainScreen = true
                            } else {
                                presentMainScreen = false
                            }
                            
                        }, label: {
                            ZStack{
                            Text(" Sign in ")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            }.background(Color.blue)
                            .opacity(1)
                        })
                        .frame(maxWidth: geometry.size.width, alignment: .trailing)
                        .padding (.trailing, 30)
                    }.padding (.top, 30)
                    
                    // Forgot Password
                    Button(action: {}, label: {
                        Text("Forgot Password?")
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                    })
                    .frame(maxWidth: geometry.size.width, alignment: .center)
                    .padding (.top, 50)
                    
                }.padding(.top, 180)
            }
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(presentMainScreen: .constant(true),  presentRegScreen: .constant(true))
        
    }
}
