//
//  OrderConfirm.swift
//  Final
//
//  Created by error on 2020/11/27.
//

import SwiftUI


struct OrderConfirm: View{
    @EnvironmentObject var valid:validCheckout
    @EnvironmentObject var orderHistory:OrderHistory
    @EnvironmentObject var user:UserAccount
    @EnvironmentObject var cart:Cart
    @State var date = DateFormatter()
    @State var confirmPress = false
    @Binding var selectedTab:Tabs
    var body: some View {
                VStack{
                    Section(header:
                        Text("Order Confirm")
                    ){
                        Text("Order: #\(getOrderNumber())")
                        Text("Delery day: \(getDeliveryDate())")
                        Text(getFullName())
                        Text("\(getAddress())")
                        Text("\(valid.phoneNumber)")
                        Button(action: {
                            if (user.LoginIn == "yes"){
                                orderHistory.list.append(Order(_fullname: getFullName(), _address: getAddress(), _orderDate: getOrderDate(), _orderNumber: getOrderNumber(), _deliveryDate: getDeliveryDate()))
                            }else{
                                print("because use not login, so will not add to order history")
                            }
                            selectedTab = Tabs.home
                            cart.removeAll()
                        }, label: {
                            Text("Done")
                        })
                    }//section
                }//vstack
                .navigationBarHidden(true)
    }//body
    
    //getDeliveryDate
    func getDeliveryDate() -> String{
        
        let datef = DateFormatter()
        datef.dateFormat = "yyyy-MM-dd"
        
        return datef.string(from: Date() + 240000)
    }
    
    //get Order date
    func getOrderDate() -> String{
        let datef = DateFormatter()
        datef.dateFormat = "yyyy-MM-dd"
        
        return datef.string(from: Date())
    }
    
    //get order number
    func getOrderNumber() -> String{
        return "128-24234-234"
    }
    
    //get full name
    func getFullName() -> String{
        return "\(valid.list[0].getFirstname()),\(valid.list[0].getLastname())"
    }
    
    //get address
    func getAddress() -> String{
        if (valid.list[0].getAddress2() == ""){
            return "\(valid.list[0].getAddress1())\n\(valid.list[0].getCity()) \(valid.list[0].getState()),\(valid.list[0].getZipcode())"
        }else{
            return "\(valid.list[0].getAddress1())\n\(valid.list[0].getAddress2()) \n\(valid.list[0].getCity()) \(valid.list[0].getState()),\(valid.list[0].getZipcode())"
        }
    }
}
struct OrderConfirm_Previews: PreviewProvider {
    static var previews: some View {
        OrderConfirm(selectedTab: .constant(Tabs.cart))
            .environmentObject(validCheckout())
            .environmentObject(OrderHistory())
            .environmentObject(UserAccount())
            .environmentObject(Cart())
    }
}
