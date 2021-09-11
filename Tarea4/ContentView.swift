//
//  ContentView.swift
//  Tarea4
//
//  Created by David Meza on 10/9/21.
//

import SwiftUI

//Enum para los botones
enum botones: String {
    case uno  = "1"
    case dos = "2"
    case tres = "3"
    case cuatro = "4"
    case cinco = "5"
    case seis = "6"
    case siete = "7"
    case ocho = "8"
    case nueve = "9"
    case cero = "0"
    case punto = "."
    case sumar = "+"
    case restar = "-"
    case dividir = "/"
    case multiplicar = "x"
    case igual = "="
    case borrar = "AC"
    case porcentaje = "%"
    case negativo = "+/-"
    
    var colorDeBoton: Color {
        switch self {
        case .sumar, .restar, .multiplicar, .dividir, .igual:
            return.orange
        case .borrar, .negativo, .porcentaje:
            return Color(.lightGray)
        default:
            return(Color.blue)
        }
    }
}

struct ContentView: View {
    
    //Arreglo para el display de los botones
    let botonesArray: [[botones]] = [
        [.borrar, .negativo, .porcentaje, .dividir],
        [.siete, .ocho, .nueve, .multiplicar],
        [.cuatro, .cinco, .seis, .restar],
        [.uno, .dos, .tres, .sumar],
        [.cero, .cero, .punto, .igual]
    
    ]
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack{
                Spacer()
                //Espacio para resultado
                HStack{
                    Spacer()
                    Text("0")
                        .bold()
                        .font(.system(size: 64))
                        .foregroundColor(.white)
                    
                }
                .padding()
                
                
                //Botones
                ForEach(botonesArray, id: \.self) {row in
                    HStack(spacing: 12){
                        ForEach(row, id: \.self) { item in
                            Button(action: {
                                
                            }, label: {
                                Text(item.rawValue)
                                    .font(.system(size: 36))
                                    .frame(width: 100, height: 100)
                                    .background(item.colorDeBoton)
                                    .foregroundColor(Color.white)
                                
                            })
                        }
                    }
                    .padding(.bottom, 3)
                    
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
