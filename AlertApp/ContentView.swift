//
//  ContentView.swift
//  AlertApp
//
//  Created by Ez Heisenberg on 30/11/2020.
//

import SwiftUI

struct Cart: Identifiable {
    var id = UUID()
    var nbProduct: Int = 0
}


struct ContentView: View {
    
    @State var validateAlerteIsPresented: Bool = false
    @State var destructiveAlertIsPresented: Bool = false
    @State var twoButtonsAlertIsPresented: Bool = false
    
    @State var modelAlertIsPresented: Bool = false
    @State var cart: Cart?

    
    var body: some View {
        NavigationView{
            VStack(spacing: 20){
                Button(action: {
                    print("Good")
                    self.validateAlerteIsPresented = true
                }, label: {
                    Text("Alerte simple avec titre").frame(width: 250, height: 50).foregroundColor(Color.white)
                        .background(
                            RoundedRectangle(cornerRadius: 20, style: .circular).foregroundColor(Color.green)
                        )
                }).alert(isPresented: $validateAlerteIsPresented, content: {
                    Alert(title: Text("Validé"))
                })
                
                
                
                //Renvois une alerte avec un desmiss btn
                Button(action: {
                    self.destructiveAlertIsPresented = true
                    print("Supprimé")
                }, label: {
                    Text("Alerte destructive").frame(width: 250, height: 50).foregroundColor(Color.white)
                        .background(RoundedRectangle(cornerRadius: 20, style: .circular).foregroundColor(Color.red))
                }).alert(isPresented: $destructiveAlertIsPresented, content: {
                    Alert(title: Text("Vous pouvez à présent annulé ce choix"), message: Text("Validé"), dismissButton: Alert.Button.destructive(Text("Êtes-vous sur ?")))
                })
                
                
                //Renvois une alterye avec 2 bouton
                Button(action: {
                    self.twoButtonsAlertIsPresented = true
                }, label: {
                    Text("Alerte avec double boutton").frame(width: 250, height: 50).foregroundColor(Color.white)
                        .background(RoundedRectangle(cornerRadius: 20, style: .circular).foregroundColor(Color.orange))
                }).alert(isPresented: $twoButtonsAlertIsPresented, content: {
                    Alert(title: Text("Alerte Double"), message: Text("Souhaitez-vous continuer ?"), primaryButton: Alert.Button.default(Text("OK"), action: {
                        print("OK cest validé")
                    }), secondaryButton: Alert.Button.cancel(Text("Retour"), action: {
                        print("annuler")
                    }))
                })
                
                
                
                //Alert avec model
                Button(action: {
                    self.cart = Cart(nbProduct: 8)
                }, label: {
                    Text("Alerte avec model").frame(width: 250, height: 50).foregroundColor(Color.white)
                        .background(RoundedRectangle(cornerRadius: 20, style: .circular).foregroundColor(Color.blue))
                }).alert(item: $cart, content: {
                    (cart) in Alert(title: Text("Pannier"), message: Text("Vous avez \(cart.nbProduct) articles dans votre pannier"))
                })
                
                
                
            }.navigationBarTitle("Alert List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
