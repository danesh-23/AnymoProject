//
//  File.swift
//  
//
//  Created by David Newell on 10/15/21.
//

import SwiftUI

public struct Carousel: View {
    
    public init(cardItems: [CarouselItem], defaultButtonTitle: String = "Next", lastPageButtonTitle: String? = nil) {
        self.cards = cardItems
        self.cardWidth = UIScreen.main.bounds.width
        self.currentCard = cardItems.first ?? CarouselItem.sample1
        self.defaultButtonTitle = defaultButtonTitle
        lastPageButtonTitle != nil ? (self.lastPageButtonTitle = lastPageButtonTitle!) : (self.lastPageButtonTitle = defaultButtonTitle)
    }
    
    var cards: [CarouselItem]
    var cardWidth: CGFloat
    var defaultButtonTitle: String
    var lastPageButtonTitle: String
    
    
    @State var currentCardIndex: Int = 0
    @State var currentCard: CarouselItem
    
    public var body: some View {
        ZStack {
            Image(currentCard.background)
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                currentCard
                Spacer()
                Button {
                    advanceToNextCard()
                } label: {
                    Text(currentCardIndex != cards.count - 1 ? defaultButtonTitle : lastPageButtonTitle)
                        .frame(minWidth: 0, maxWidth: cardWidth)
                        .font(.headline)
                        .padding()
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 100)
                                .stroke(Color.blue, lineWidth: 2)
                        ).background(RoundedRectangle(cornerRadius: 100).fill(Color.blue))
                }
                .padding(.leading, 8)
                .padding(.trailing, 8)
                .padding(.bottom, 8)
                
                HStack {
                    ForEach(0..<cards.count) { index in
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(index == currentCardIndex ? .white : Color.gray.opacity(0.5))
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(Color.black.opacity(0.3), lineWidth: 1)
                    )
                }
                .padding(.bottom, 8)
            }
        }
        .animation(.easeInOut(duration: 0.5))        
        .gesture(DragGesture(minimumDistance: 10, coordinateSpace: .global).onEnded {
            if $0.location.x > $0.startLocation.x {
                retreatToPreviousCard()
            } else {
                advanceToNextCard()
            }
        })
        
    }
    
    private func advanceToNextCard() {
        currentCardIndex != cards.count - 1 ? currentCardIndex += 1 : (currentCardIndex = 0)
        currentCard = cards[currentCardIndex]
    }
    
    private func retreatToPreviousCard() {
        currentCardIndex != 0 ? currentCardIndex -= 1 : nil
        currentCard = cards[currentCardIndex]
    }
}

struct Carousel_Previews: PreviewProvider {
    static var previews: some View {
        let carousel1 = CarouselItem.sample1
        let carousel2 = CarouselItem.sample2
        let carousel3 = CarouselItem.sample3

        Carousel(cardItems: [carousel1, carousel2, carousel3], defaultButtonTitle: "Next")
    }
}
