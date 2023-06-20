//
//  ContentView.swift
//  Sumdinger
//
//  Created by Zeta Lenhart-Boyd on 2/21/23.
//

import SwiftUI

struct ContentView: View {
    @State var dieOneRadius: CGFloat = 0
    @State var dieTwoRadius: CGFloat = 0
    @State var dieThreeRadius: CGFloat = 0
    @State var dieFourRadius: CGFloat = 0
    @State var dieFiveRadius: CGFloat = 0
    
    @ObservedObject var picker = Picker()
    
    var body: some View {
        VStack {
            Text("Sumdinger")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .multilineTextAlignment(.center)
                .padding(1.0)
            HStack {
                VStack(alignment: .leading) {
                    Text("3")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(picker.usedColor(sum: 3))
                    Text("4")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(picker.usedColor(sum: 4))
                    Text("5")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(picker.usedColor(sum: 5))
                    Text("6")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(picker.usedColor(sum: 6))
                    Text("7")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(picker.usedColor(sum: 7))
                    Text("8")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(picker.usedColor(sum: 8))
                    Text("9")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(picker.usedColor(sum: 9))
                    Text("10")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(picker.usedColor(sum: 10))
                    Text("11")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(picker.usedColor(sum: 11))
                }
                .padding(30.0)
                VStack(alignment: .trailing) {
                    Image(picker.see(at: 0).imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(6.0)
                        .shadow(color: .red, radius: dieOneRadius)
                        .onTapGesture {
                            picker.tap(at: 0)
                            if picker.isSelected(at: 0) {
                            dieOneRadius = 10
                            }
                            else {
                                dieOneRadius = 0
                            }
                        }
                    Image(picker.see(at: 1).imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(6.0)
                        .shadow(color: .orange,
                                radius: dieTwoRadius)
                        .onTapGesture {
                            picker.tap(at: 1)
                            if picker.isSelected(at: 1) {
                                dieTwoRadius = 10
                            }
                            else {
                                dieTwoRadius = 0
                            }
                        }
                    Image(picker.see(at: 2).imageName)
                        .resizable()
                        .padding(6.0)
                        .shadow(color: .yellow,
                                radius: dieThreeRadius)
                        .aspectRatio(contentMode: .fit)
                        .onTapGesture {
                            picker.tap(at: 2)
                            if picker.isSelected(at: 2){
                                dieThreeRadius = 10
                            }
                            else {
                                dieThreeRadius = 0
                            }
                        }
                    Image(picker.see(at: 3).imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(6.0)
                        .shadow(color: .green,
                                radius: dieFourRadius)
                        .onTapGesture {
                            picker.tap(at: 3)
                            if picker.isSelected(at: 3){
                                dieFourRadius = 10
                            }
                            else {
                                dieFourRadius = 0
                            }
                        }
                    Image(picker.see(at: 4).imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(6.0)
                        .shadow(color: .blue,
                                radius: dieFiveRadius)
                        .onTapGesture {
                            picker.tap(at: 4)
                            if picker.isSelected(at: 4) {
                                dieFiveRadius = 10
                            }
                            else {
                                dieFiveRadius = 0
                            }
                        }
                }
                .controlSize(.small)
                .padding(30.0)
                
            }
            Button(action: {
                picker.roll()
                dieOneRadius = 0
                dieTwoRadius = 0
                dieThreeRadius = 0
                dieFourRadius = 0
                dieFiveRadius = 0
            }) {
                Text("Roll Again")
                    .font(.title)
                    .fontWeight(.heavy)
            }.padding(11.0)
                .buttonStyle(.bordered)
                .disabled(picker.canIRoll)
            
            Text("selected: \(picker.selectedText)")
            Text("sum: \(picker.sumText)")
        }
        .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
