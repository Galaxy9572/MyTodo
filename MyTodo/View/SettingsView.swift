//
//  SettingsView.swift
//  MyTodo
//
//  Created by 廖俊瑶 on 2023/4/17.
//

import SwiftUI

struct SettingsView: View {
    
    @State var currentAmount: CGFloat = 1
//    @State var lastAmount: CGFloat = 0
    
    var body: some View {
        VStack {
            Button ("success"){
                HapticManager.instance.notificate(.success)
            }
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10)
            
            Button ("warning"){
                HapticManager.instance.notificate(.warning)
            }
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10)
            
            Button ("error"){
                HapticManager.instance.notificate(.error)
            }
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10)
            
            Button ("heavy"){
                HapticManager.instance.impact(.heavy)
            }
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10)
            
            Button ("rigid"){
                HapticManager.instance.impact(.rigid)
            }
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10)
            
            Button ("medium"){
                HapticManager.instance.impact(.medium)
            }
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10)
            
            Button ("light"){
                HapticManager.instance.impact(.light)
            }
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10)
            
            Button ("soft"){
                HapticManager.instance.impact(.soft)
            }
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10)
        }
        }
        
        
        
        
//        Rectangle()
//            .frame(width: 200, height: 300)
//            .cornerRadius(20)
//            .foregroundColor(Color.blue)
//            .padding()
//            .padding(.horizontal)
//            .scaleEffect(currentAmount)
//            .gesture(
//                MagnificationGesture().onChanged{ value in
//                    print(value)
//                    currentAmount = value
//                }.onEnded {value in
//                    withAnimation(.spring()) {
//                        currentAmount = 1
//                    }
//                }
//                DragGesture().onChanged{ value in
//                    var moveSize = value.translation.width
//                    var halfSize = UIScreen.main.bounds.width / 2
//                    withAnimation(.spring()) {
//
//                    }
//                }
//            )
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
