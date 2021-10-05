//
//  RegistrationView.swift
//  GitLit
//  GitLit
//
//  Created by Jai TImsina on 9/21/21.
//

import SwiftUI
import Firebase

struct RegistrationView: View {
    
    @Binding var presentRegScreen: Bool

    @State var regEmail = ""
    @State var regPassword = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Account Registration")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .kerning(1.8)
                    .frame(
                        width: geometry.size.width,
                        alignment: .center)
                    .padding(.top, 20)
                
                // Email
                Text("Your email")
                    .font(.system(size: 20))
                    .kerning(1.2)
                    .padding(.leading,5)
                    .padding(.top, 100)
                    .frame(
                        width: geometry.size.width,
                        alignment: .leading)
                TextField("sample@email.com", text: $regEmail)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding(.leading,5)
                    .background(Color(.secondarySystemBackground))
                
                // Password
                Text("Enter password")
                    .font(.system(size: 20))
                    .kerning(1.2)
                    .padding(.leading,5)
                    .padding(.top, 20)
                    .frame(
                        width: geometry.size.width,
                        alignment: .leading)
                TextField("qwerty123456", text: $regPassword)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding(.leading,5)
                    .background(Color(.secondarySystemBackground))
                
                
                // Button
                Button(action: {
                    viewModel.signUp(email: regEmail, password: regPassword)
                    presentRegScreen = false
                }, label: {
                    ZStack{
                    Text(" Register ")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    }.background(Color.blue)
                    .opacity(1)
                })
                .frame(maxWidth: geometry.size.width, alignment: .center)
                .padding(.top, 25)
            }
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView(presentRegScreen: .constant(false))
    }
}
