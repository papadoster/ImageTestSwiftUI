//
//  DesignView.swift
//  ImageTestSwiftUI
//
//  Created by Александр Карпов on 03.03.2023.
//

import SwiftUI

struct DesignBigView: View {
    
    var image: String
    var secondName: String
    var firstName: String
    var quote: String
    
    var body: some View {
        ZStack {
            Image("back-m")
                .resizable()
            
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
                ImageView(urlString: image)
                    .frame(width: 2000, height: 3000, alignment: .leading)
                    .position(x: 1300, y: 130)
                
            }
            .frame(maxHeight: 250)
        }
    }
}

struct DesignBigView_Previews: PreviewProvider {
    static var previews: some View {
        DesignBigView(image: "https://firebasestorage.googleapis.com/v0/b/imagetestswiftui.appspot.com/o/409a%2Fportraits%2F0921.jpg?alt=media&token=b809d946-f63e-42d9-9012-11972179f8a0", secondName: "", firstName: "", quote: "")
            .previewLayout(.sizeThatFits)
    }
}
