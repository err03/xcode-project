//
//  SingleCardView.swift
//  BiliBiliProject1
//
//  Created by error on 2022/4/21.
//

import SwiftUI
/*

//MARK: SingleCardView
struct SingleCardView:View{
    var index:Int
    @EnvironmentObject var userData:Todo    //由于是类是从父类传过来的，如果不加上@EnviornmentObject 的话，父类更新，子类就不会更新
    @State var showEditingPage = false
    @Binding var editingMode:Bool
    @Binding var selection:[Int]
    @Binding var animatinoValue:CGFloat
    
    var body: some View {
        HStack{
            
            Rectangle()
                .frame(width: 4)
                .foregroundColor(.blue)
            
            if self.editingMode{
                Button {
                    self.userData.delete(id: self.index)
                    animatinoValue += 1
                } label: {
                    Image(systemName: "trash")
                        .imageScale(.large)
                        .padding(.leading)
                }//button
            }//if
            
            Button {
                if !self.editingMode{
                    self.showEditingPage = true
                }
            } label: {
                Group {
                    VStack(alignment: .leading, spacing: 6){
                        Text(userData.TodoList[index].title)
                            .font(.headline)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        
                        Text(userData.TodoList[index].dueDate.description)
                            .font(.headline)
                            .foregroundColor(.gray)
                    }//VStack
                    .padding(.leading)
                    Spacer()
                }//group
            }//Button
            .sheet(isPresented: self.$showEditingPage) {
                EditingPage(
                    title:userData.TodoList[self.index].title,
                    dueDate:userData.TodoList[self.index].dueDate,
                    id: self.index)
                    .environmentObject(self.userData)
            }//sheet
            
            if self.userData.TodoList[index].isFavorite{
                Image(systemName: "star.fill")
                    .imageScale(.large)
                    .foregroundColor(.yellow)
            }
            
            if !self.editingMode{
                Image(systemName: userData.TodoList[index].isChecked ? "checkmark.square.fill" : "square")
                    .imageScale(.large)
                    .padding(.trailing)
                    .onTapGesture {
                        userData.check(id: index)
                    }
            }else{
                let targetIndex = self.selection.firstIndex(where: {
                    $0 == self.index
                })
                Image(systemName: targetIndex == nil ? "circle" : "checkmark.circle.fill")
                    .imageScale(.large)
                    .padding(.trailing)
                    .onTapGesture {
                        if targetIndex == nil{
                            self.selection.append(index)
                        }else{
                            self.selection.remove(at: targetIndex!)
                        }//if..else
                    }//onTapGesture
            }//if..else
                
        }//HStack
        .frame(height: 80)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10,x: 0,y:10)
    }//body
}

struct SingleCardView_Previews: PreviewProvider {
    static var previews: some View {
        SingleCardView(index: 0, editingMode: ContentView().$editingMode, selection: ContentView().$selection, animatinoValue: ContentView().$animationValue)
    }
}
*/
