//
//  ContentView.swift
//  TestApp
//
//  Created by David Newell on 10/15/21.
//

import SwiftUI
import UnflowInterviewApp

struct ContentView: View {
    var body: some View {
        let car1 = CarouselItem.sample1
        let car2 = CarouselItem.sample2
        let car3 = CarouselItem.sample3
        let car4 = CarouselItem.sample4

        Carousel(cardItems: [car1, car3, car2, car4], defaultButtonTitle: "Next", lastPageButtonTitle: "Start Again")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
