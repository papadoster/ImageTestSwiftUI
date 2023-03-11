//
//  DesignMiniView.swift
//  ImageTestSwiftUI
//
//  Created by Александр Карпов on 03.03.2023.
//

import SwiftUI

struct DesignMiniView: View {
    var image: String
    var secondName: String
    var firstName: String
    var quote: String
    
    var body: some View {
        ZStack {
            Image("back-m")
                .resizable()
                .aspectRatio(contentMode: .fit)
//                .scaledToFit()
            
//                      Image("001-01")
//                          .resizable()
//                          .aspectRatio(contentMode: .fit)
            
            HStack {
                ImageView(urlString: image)
                    .frame(height: 200)
                    .offset(x: -50, y: -0)
                    .padding(.leading, 20)
                
                
                
                VStack(alignment: .leading, spacing: 0) {
                    Spacer()
                    HStack {
                        Text(quote == "" ? "Мечты сбываются, только если ты идëшь им навстречу с открытыми глазами" : quote)
                            .font(.system(size: 6))
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.black)
                            .fontWeight(.light)
                            .frame(maxWidth: 80, alignment: .leading)
                    }
                    .offset(x: -17, y: 10)
                    
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
                    .offset(x: -5, y: 6)
                    
                    Spacer()
                }
                .frame(maxHeight: 250)
                
                
                
            }
        }
    }
}
    
    struct DesignMiniView_Previews: PreviewProvider {
        static var previews: some View {
            DesignMiniView(image: "https://firebasestorage.googleapis.com:443/v0/b/imagetestswiftui.appspot.com/o/409a%2Fportraits%2Fmini%2F1201.jpg?alt=media&token=f63afc39-14b9-47cd-8b4d-bc410f771e2e", secondName: "", firstName: "", quote: "")
                .previewLayout(.sizeThatFits)
        }
    }
