//
//  CartView.swift
//  Final
//
//  Created by error on 2020/11/18.
//

import SwiftUI


//MARK: cartView - mainview
struct CartView: View {
    @EnvironmentObject var cart:Cart
    @Binding var selectedTab:Tabs
    var body: some View {
            VStack{
                if(cart.list.isEmpty){
                    Text("Current have no Item")
                }else{
                    Section(footer:
                        NavigationLink(destination:CheckoutView(selectedTab: $selectedTab)){
                            Text("CheckOut:\(totalPrice())")
                                .fontWeight(.bold)
                                .font(.title2)
                                .frame(width: 200, height: 80)
                                .background(Color.blue)
                                .foregroundColor(.black)
                        }//navigationlink
                    ){
                        List{
                            ForEach(cart.list){c in
                                NavigationLink(destination:ProductDetailView(product: c)){
                                    HStack{
                                        Image(c.getImage())
                                            .resizable()
                                            .frame(width:80,height:50)
                                        VStack(alignment:.leading){
                                            Text("Name:\(c.getName())")
                                                .font(.title3)
                                                .frame(width: 280, height: 30,alignment: .leading)
                                            Text("Qty:\(c.getQty())")
                                            
                                            let price = String(format:"%.2f",c.getPrice() * Double(c.getQty()))
                                            Text("Price: $\(price)")
                                                .frame(width: 280, height: 30,alignment: .leading)
                                        }//vstack
                                        .font(.system(size: 23))
                                    }//hstack
                                }//navigation link
                            }//for each
                                .onMove(perform: { indices, newOffset in
                                    cart.list.move(fromOffsets: indices, toOffset: newOffset)
                                })
                                .onDelete(perform: { indexSet in
                                    cart.remove(at: indexSet)
                                })
                        }//list
                        .navigationBarHidden(true)
                    }//section
                }//else
            }//vstack
    }//body
    
    func totalPrice() -> String{
        var totalprice = 0.0
        for i in 0..<cart.list.count{
            let price = cart.list[i].getPrice() * Double(cart.list[i].getQty())
            totalprice += price
        }
        
        return String(format:"%.2f",totalprice)
    }//total price
    
}//CartView
//-------------------------------------------------------------------------------------
//MARK: item template
//item template
struct itemTemplate:View{
    
    var cart:Cart
    init(_cart:Cart){
        self.cart = _cart
    }
    
    var body: some View{
        
        ForEach(cart.list){c in
            NavigationLink(destination:ProductDetailView(product: c)){
                itemView(_c: c)
                
            }//navigation link
        }//for each
            .onMove(perform: { indices, newOffset in
                cart.list.move(fromOffsets: indices, toOffset: newOffset)
            })
            .onDelete(perform: { indexSet in
                cart.remove(at: indexSet)
            })
        
    }//body
}//item template

//MARK: item view
struct itemView:View {
    
    var c:Product
    init(_c:Product){
        self.c = _c
    }
    
    var body: some View{
        
        HStack(alignment:.top){
            Image(systemName: "app")
                .font(.system(size: 150))
            VStack(alignment:.leading){
                Text("Name:\(c.getName())")
                Text("Qty:\(c.getQty())")
                
                let price = String(format:"%.2f",c.getPrice() * Double(c.getQty()))
                Text("Price: $\(price)")
                    .padding(.top)
                
            }//vstack
            .font(.system(size: 23))
            .padding()
        }//hstack
        
    }//body
}

//MARK:preview
struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(selectedTab: .constant(Tabs.cart))
            .environmentObject(Cart())
    }
}
