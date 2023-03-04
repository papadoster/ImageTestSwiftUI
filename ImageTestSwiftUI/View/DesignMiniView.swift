//
//  DesignMiniView.swift
//  ImageTestSwiftUI
//
//  Created by Александр Карпов on 03.03.2023.
//

import SwiftUI

struct DesignMiniView: View {
    var image: Int
    var secondName: String
    var firstName: String
    var quote: String
    
    var body: some View {
        ZStack {
            Image("back-m")
                .resizable()
//                .aspectRatio(contentMode: .fit)
                .scaledToFit()
            
            //          Image("001-01")
            //              .resizable()
            //              .aspectRatio(contentMode: .fit)
            
            HStack {
                ImageView(urlString: "https://picsum.photos/id/\(image)/2000/3000")
                    .frame(height: 215)
                    .offset(x: -50, y: -0)
                    .padding(.leading, 20)
                
                
                
                VStack(alignment: .leading, spacing: 0) {
                    Spacer()
                    Text(quote == "" ? "Мечты сбываются, только если ты идëшь им навстречу с открытыми глазами" : quote)
                        .font(.system(size: 6))
//                        .frame(alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black)
                        .fontWeight(.light)
                        
//                        .frame(width: 689, height: 174, alignment: .leading)
//                        .position(x: 2307, y: 906)
                        .frame(maxWidth: 80)
                        .offset(x: -21, y: 8)
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text(firstName == "" ? "Имя".uppercased() : firstName.uppercased())
                            .font(.system(size: 12))
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        Text(secondName == "" ? "Фамилия".uppercased() : secondName.uppercased())
                            .font(.system(size: 12))
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        
                    }
                    .offset(x: -10, y: 4)
                    
                    Spacer()
                }
                .frame(maxHeight: 250)
                
                
                
            }
        }
    }
}
    
    struct DesignMiniView_Previews: PreviewProvider {
        static var previews: some View {
            DesignMiniView(image: 1, secondName: "", firstName: "", quote: "")
        }
    }
