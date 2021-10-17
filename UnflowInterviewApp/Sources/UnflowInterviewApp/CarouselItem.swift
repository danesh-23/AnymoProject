//
//  CarouselItem.swift
//  
//
//  Created by Danesh Rajasolan on 2021-10-16.
//

import SwiftUI

public struct CarouselItem: View {
    var headerText: String
    var bodyText: Binding<String>
    var displayImage: String
    var background: String
    
    public init(headerText: String, bodyText: Binding<String>, displayImage: String = "", background: String) {
        self.headerText = headerText
        self.bodyText = bodyText
        self.background = background
        self.displayImage = displayImage
    }
    
    public var body: some View {
        ZStack(alignment: Alignment.top) {
            Image(background)
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Image(displayImage)
                    .resizable()
                    .scaledToFit()

                Text(headerText)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                TextView(text: bodyText)
                    .foregroundColor(.gray)
                    .padding()
            }
        }
    }
}

extension CarouselItem {
    public static var sample1: CarouselItem = .init(headerText: "Introducing Audio Rooms", bodyText: .constant("We all know video calls can get tiring, so we've introduced a new form of room, just for audio.\nShare stories, music, or just listen to ambient sound while working from home."), displayImage: "image1", background: "bg1")
    public static var sample2: CarouselItem = .init(headerText: "Smart Noise Cancellation", bodyText: .constant("Whether it's the builders or a very vocal puppy, we know you don't want to share all ambient noise -- so we've built in smart noise cancellation to keep your stream zen."), displayImage: "image2", background: "bg2")
    public static var sample3: CarouselItem = .init(headerText: "Boogie Mode", bodyText: .constant("Use Audio Rooms for fun activities like socials. Turn Boogie Mode to have a random song play and so you can dance and get your heart pumping -- the best part, nobody can see you!"), displayImage: "image3", background: "bg3")
    public static var sample4: CarouselItem = .init(headerText: "No Display Image Boogie Mode", bodyText: .constant("Use Audio Rooms for fun activities like socials. Turn Boogie Mode to have a random song play and so you can dance and get your heart pumping -- the best part, nobody can see you!"), background: "bg3")
}

extension CarouselItem: Equatable {
    public static func == (lhs: CarouselItem, rhs: CarouselItem) -> Bool {
        lhs.displayImage == rhs.displayImage && lhs.background == rhs.background && lhs.bodyText.wrappedValue == rhs.bodyText.wrappedValue && lhs.headerText == rhs.headerText
    }
}
