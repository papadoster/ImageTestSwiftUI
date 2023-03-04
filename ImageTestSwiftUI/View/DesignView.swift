//
//  DesignView.swift
//  ImageTestSwiftUI
//
//  Created by Александр Карпов on 03.03.2023.
//

import SwiftUI
import NukeUI

struct DesignView: View {
    
    var image: Int
    var secondName: String
    var firstName: String
    var quote: String

    @StateObject private var imageTwo = FetchImage()
    
    var body: some View {
        ZStack {
            Image("back-m")
                .resizable()
            
            //                .aspectRatio(contentMode: .fit)
            
            //          Image("001-01")
            //              .resizable()
            //              .aspectRatio(contentMode: .fit)
            
            Text(quote == "" ? "Мечты сбываются, только если ты идëшь им навстречу с открытыми глазами" : quote)
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
                ImageView(urlString: "https://picsum.photos/id/\(image)/2000/3000")
                    .frame(width: 2000, height: 3000, alignment: .leading)
                    .position(x: 1300, y: 130)
//                    .offset(x: -50, y: -0)
//                    .padding(.leading, 20)

                
                
                
            }
            .frame(maxHeight: 250)
            
            
            
        }
        
    }
}

struct DesignView_Previews: PreviewProvider {
    static var previews: some View {
        DesignView(image: 100, secondName: "", firstName: "", quote: "")
            .previewLayout(.sizeThatFits)
    }
}
