//
//  ContentView.swift
//  GitLit
//
//  Created by Field Employee on 16/09/2021.
//

import SwiftUI
import CoreData
import Firebase

class AppViewModel: ObservableObject {
    
    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result  != nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self?.signedIn = true
                //LoginView.presentMainScreen = true
            }
        }
    }
    
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result  != nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
}

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @EnvironmentObject var viewModel: AppViewModel

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    @State public var presentMainScreen = false
    @State private var presentRegScreen = false
    @State private var presentLogScreen = false

    
    var body: some View {
        
            VStack{
                LoginView(presentMainScreen: $presentMainScreen, presentRegScreen: $presentRegScreen)
                
                AudioPlayerView()
            }
        
            .fullScreenCover(isPresented: $presentMainScreen) {
                
                    VStack {
                        RestaurantsView()
                            //.padding(.top, -200)
                        Button("Logout") {
                            presentMainScreen = false
                        }
                    }
              }

            .fullScreenCover(isPresented: $presentRegScreen, content: {
                RegistrationView(presentRegScreen: $presentRegScreen)
            })
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
