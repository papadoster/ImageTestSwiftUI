//
//  DesignView.swift
//  ImageTestSwiftUI
//
//  Created by Александр Карпов on 03.03.2023.
//

import SwiftUI

struct DesignView: View {
    
    var image: Int
    var secondName: String
    var firstName: String
    
    var body: some View {
        ZStack {
            Image("back-m")
                .resizable()
            
            //                .aspectRatio(contentMode: .fit)
            
            //          Image("001-01")
            //              .resizable()
            //              .aspectRatio(contentMode: .fit)
            
            Text("Мечты сбываются, только если ты идëшь им навстречу с открытыми глазами")
                .font(.system(size: 64))
                .fontWeight(.light)
                .multilineTextAlignment(.leading)
                .frame(width: 900, alignment: .leading)
                .position(x: 3200, y: 1256)
            
                Text(firstName == "" ? "Имя".uppercased() : firstName.uppercased())
                    .font(.system(size: 182))
                    .fontWeight(.heavy)
                    .frame(width: 1500, alignment: .leading)
                    .position(x: 3650, y: 2300)
                Text(secondName == "" ? "Фамилия".uppercased() : secondName.uppercased())
                    .font(.system(size: 182))
                    .fontWeight(.heavy)
                    .frame(width: 1500,alignment: .leading)
                    .position(x: 3650, y: 2530)
            
            HStack {
                ImageGridItemView(idImage: image)
                    .frame(height: 215)
                    .offset(x: -50, y: -0)
                    .padding(.leading, 20)

                
                
            }
            .frame(maxHeight: 250)
            
            
            
        }
        
    }
}

struct DesignView_Previews: PreviewProvider {
    static var previews: some View {
        DesignView(image: 100, secondName: "", firstName: "")
            .previewLayout(.sizeThatFits)
    }
}
