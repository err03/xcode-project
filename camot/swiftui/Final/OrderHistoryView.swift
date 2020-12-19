//
//  OrderHistoryView.swift
//  Final
//
//  Created by error on 2020/11/30.
//

import SwiftUI

struct OrderHistoryView: View {
    @EnvironmentObject var orderhistory:OrderHistory
    var body: some View {
        List(orderhistory.list){order in
            NavigationLink(destination:OrderView(order: order)){
                HStack{
                    VStack{
                        Text("order #\(order.getOrderNumber())")
                        Text("delivery date:\(order.getOrderDate())")
                    }//vstack
                }//hstack
            }//navigation link
        }//list
    }//body
}

struct OrderHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        OrderHistoryView()
            .environmentObject(OrderHistory())
    }
}
