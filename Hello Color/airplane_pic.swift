//
//  airplane_pic.swift
//  Hello Color
//
//  Created by Nawapon Sangsiri on 14/11/2564 BE.
//

import SwiftUI

struct airplane_pic: View {
    var body: some View {
        Image("profile")
            .resizable()
            .frame(width: 400, height: 250)
    }
}

struct airplane_pic_Previews: PreviewProvider {
    static var previews: some View {
        airplane_pic()
    }
}
