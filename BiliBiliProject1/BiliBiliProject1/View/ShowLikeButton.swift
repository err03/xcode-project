//
//  ShowLikeButton.swift
//  BiliBiliProject1
//
//  Created by error on 2022/4/21.
//

import SwiftUI

//MARK: ShowLikeButton
struct ShowLikeButton:View{
    @Binding var showLikeOnly:Bool
    
    var body: some View{
        Image(systemName: self.showLikeOnly ? "star.fill" :"star")
            .imageScale(.large)
            .foregroundColor(.yellow)
            .onTapGesture {
                self.showLikeOnly.toggle()
            }//onTapGesture
    }//body
}//ShowLikeButton

struct ShowLikeButton_Previews: PreviewProvider {
    static var previews: some View {
        ShowLikeButton(showLikeOnly: ContentView().$showLikeOnly)
    }
}
