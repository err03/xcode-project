//
//  CartHosting.swift
//  Final-storyboard
//
//  Created by error on 2020/12/13.
//

import UIKit
import SwiftUI

class CartHosting:UIHostingController<AnyView> {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder,rootView: AnyView(CartView().environmentObject(Cart())))
    }
}
