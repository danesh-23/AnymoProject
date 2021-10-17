import XCTest
@testable import UnflowInterviewApp

class UnflowInterviewAppTests: XCTestCase {
    
    var carouselItems: [CarouselItem]!
    var carousel: Carousel!
    
    override func setUp() {
        carouselItems = [CarouselItem.sample1, CarouselItem.sample2, CarouselItem.sample3, CarouselItem.sample4]
        carousel = Carousel(cardItems: carouselItems)
    }
    
    func testInitialisationCarouselItem() {
        let carousel1 = carouselItems.first!
        
        XCTAssertEqual(carousel1.headerText, CarouselItem.sample1.headerText)
        XCTAssertEqual(carousel1.bodyText.wrappedValue, CarouselItem.sample1.bodyText.wrappedValue)
        XCTAssertEqual(carousel1.displayImage, CarouselItem.sample1.displayImage)
        XCTAssertEqual(carousel1.background, CarouselItem.sample1.background)
    }
    
    func testInitialisationCarousel() {
        XCTAssertTrue(!carousel.cards.isEmpty)
        XCTAssertEqual(carousel.cardWidth, UIScreen.main.bounds.width)
        XCTAssertEqual(carousel.currentCard, carouselItems.first!)
        XCTAssertEqual(carousel.currentCardIndex, 0)
        XCTAssertEqual(carousel.defaultButtonTitle, "Next")
        XCTAssertEqual(carousel.lastPageButtonTitle, "Next")
    }
    
    func testCarouselCardItems() {
        carousel.cards.enumerated().forEach { (index, value) in
            XCTAssertEqual(value, carouselItems[index])
        }
    }
    
    func testCarouselItemNoDisplayImage() {
        let lastCarousel = carousel.cards.last!
        XCTAssertEqual(carouselItems.last!.displayImage, "")
        XCTAssertEqual(lastCarousel, carouselItems.last!)
    }
    
    func testCarouselWithCustomDefaultButton() {
        let carousel = Carousel(cardItems: carouselItems, defaultButtonTitle: "Forward")
        XCTAssertEqual(carousel.defaultButtonTitle, "Forward")
        XCTAssertEqual(carousel.cards, carouselItems)
        XCTAssertEqual(carousel.lastPageButtonTitle, "Forward")
    }
    
    func testCarouselWithBothCustomButtons() {
        let carousel = Carousel(cardItems: carouselItems, defaultButtonTitle: "Forward", lastPageButtonTitle: "Start Again")
        XCTAssertEqual(carousel.lastPageButtonTitle, "Start Again")
        XCTAssertEqual(carousel.cards, carouselItems)
        XCTAssertEqual(carousel.defaultButtonTitle, "Forward")
    }
}
