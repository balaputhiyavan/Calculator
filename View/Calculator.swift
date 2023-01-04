//
//  Calculator.swift
//  Calculator
//
//  Created by Zetta_Pc on 04/01/23.
//

import SwiftUI

struct Calculator: View {
    @State var output = ""
    @State var firstvalue = [String]()
    @State var secondvalue = [String]()
    @State var input1 = ""
    @State var input2 = ""
    @State var operators = ""

    @State var buttons = [
        ["C","()","%","/"],
        ["7","8","9","X"],
        ["4","5","6","-"],
        ["1","2","3","+"],
        ["+/-","0",".","="]
        ]

    var body: some View {
        NavigationView{
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                VStack{
                    Text(output)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                    HStack{
                        if input1.isEmpty{
                            ForEach(firstvalue, id:\.self){ value in
                                    Text(value)
                                        .font(.title)
                                        .foregroundColor(.white)
                            }
                        }else{
                            ForEach(secondvalue, id:\.self){ value in
                                    Text(value)
                                        .font(.title)
                                        .foregroundColor(.white)
                            }
                        }
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity,alignment: .trailing)
                .background(Color(.gray).opacity(0.4))
                .cornerRadius(8)
                .padding()
                
                Divider()
                
                VStack(spacing: 12){
                    ForEach(buttons, id:\.self){ row in
                        HStack{
                            ForEach(row, id:\.self){ button in
                                Button(action: {
                                    if input1.isEmpty{
                                        firstvalue.append(button)
                                    }else{
                                        secondvalue.append(button)
                                    }
                                    calculations(button: button)
                                }, label: {
                                    Text(button)
                                        .font(.system(size: 32))
                                        .frame(width: 80, height:80)
                                        .foregroundColor(.white)
                                        .background(Color(.blue))
                                        .cornerRadius(60)
                                })
                            }
                        }
                    }
                }.frame(maxHeight: .infinity, alignment: .bottom)
            }
        }
        }.navigationBarHidden(true)
    }
    func calculations(button: String) {
        
        /// " C " Button
        if buttons[0][0] == button {
            firstvalue = []
            secondvalue = []
            input1 = ""
            input2 = ""
            output = ""
            
        }
        /// " + " Button
        else if buttons[3][3] == button {
            operators = firstvalue.last!
            firstvalue.removeLast()
            input1 = firstvalue.joined()
            firstvalue = []

        }

        /// " - " Button
        else if buttons[2][3] == button {
            operators = firstvalue.last!
            firstvalue.removeLast()
            input1 = firstvalue.joined()
            firstvalue = []
        }

        /// " X " Button
        else if buttons[1][3] == button {
            operators = firstvalue.last!
            firstvalue.removeLast()
            input1 = firstvalue.joined()
            firstvalue = []
        }

        /// " / " Button
        else if buttons[0][3] == button {
            operators = firstvalue.last!
            firstvalue.removeLast()
            input1 = firstvalue.joined()
            firstvalue = []
        }

        /// " = " Button
        else if buttons[4][3] == button {
            secondvalue.removeLast()
            input2 = secondvalue.joined()
            secondvalue = []
            
            if operators == "+" {
                let addition = Double(String(input1))! + Double(String(input2))!
                output = String(addition)
               print("AdditionValue: \(addition)")
                operators = ""
                
            } else if operators == "-" {
                let substraction = Double(String(input1))! - Double(String(input2))!
                output = String(substraction)
                print("Substraction: \(substraction)")
                
            } else if operators == "X" {
                let multiplication = Double(String(input1))! * Double(String(input2))!
                output = String(multiplication)
                print("Multiplication: \(multiplication)")
                
            }else if operators == "/" {
                let division = Double(String(input1))! / Double(String(input2))!
                output = String(division)
                print("Division: \(division)")
            }else{
                print(Error.self)
            }
                     
        }
    
    }
}

struct Calculator_Previews: PreviewProvider {
    static var previews: some View {
        Calculator()
    }
}
