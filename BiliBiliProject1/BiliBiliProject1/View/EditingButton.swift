//
//  EditButtonView.swift
//  BiliBiliProject1
//
//  Created by error on 2022/4/21.
//

import SwiftUI

struct EditingButton: View {
    @Binding var editingMode:Bool
    @Binding var selection:[Int]
    @Binding var animationValue:CGFloat
    
    var body: some View{
        
        Button {
            self.editingMode.toggle()
            self.selection.removeAll()
            animationValue += 1
        } label: {
            Image(systemName: "gear")
                .imageScale(.large)
        }//button

    }//body
}

struct EditButtonView_Previews: PreviewProvider {
    static var previews: some View {
        EditingButton(editingMode: ContentView().$editingMode, selection: ContentView().$selection, animationValue: ContentView().$animationValue)
    }
}
