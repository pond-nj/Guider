//
//  CircleImage.swift
//  Hello Color
//
//  Created by Nawapon Sangsiri on 14/11/2564 BE.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("airplane")
            .resizable()
            .frame(width: 150, height: 150)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
