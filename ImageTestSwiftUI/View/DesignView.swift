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
                
                
                
                //                VStack(alignment: .leading, spacing: 0) {
                //                    Spacer()
                //                    Text("Мечты сбываются, только если ты идëшь им навстречу с открытыми глазами")
                //                        .font(.system(size: 48))
                //                        .fontWeight(.light)
                //                        .frame(width: 689, height: 174, alignment: .leading)
                //                        .position(x: 2307, y: 906)
                //                        .frame(maxWidth: 80)
                //                        .offset(x: -21, y: 8)
                
                //                    Spacer()
                
                //                    VStack(alignment: .leading) {
                //                        Text(firstName == "" ? "Имя".uppercased() : firstName.uppercased())
                //                            .font(.system(size: 12))
                //                            .fontWeight(.heavy)
                //                        Text(secondName == "" ? "Фамилия".uppercased() : secondName.uppercased())
                //                            .font(.system(size: 12))
                //                            .fontWeight(.heavy)
                //                    }
                //                    .offset(x: -10, y: 4)
                //
                //                    Spacer()
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
