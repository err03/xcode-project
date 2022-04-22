//
//  LikeButton.swift
//  BiliBiliProject1
//
//  Created by error on 2022/4/21.
//

import SwiftUI

//MARK: LikeButton
struct LikeButton:View{
    
    @EnvironmentObject var userData:Todo
    @Binding var selection:[Int]
    @Binding var editingMode:Bool
    
    var body: some View{
        Image(systemName: "star.lefthalf.fill")
            .imageScale(.large)
            .foregroundColor(.yellow)
            .onTapGesture {
                for i in self.selection{
                    self.userData.TodoList[i].isFavorite.toggle()
                }
                self.editingMode = false
            }//ontap
    }
}//LikeButton

struct LikeButton_Previews: PreviewProvider {
    static var previews: some View {
        LikeButton(selection: ContentView().$selection, editingMode: ContentView().$editingMode)
    }
}
