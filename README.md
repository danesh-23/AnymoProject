# AnymoProject
Create a carousel to be used as an imported package for external users. Designed a SwiftUI carousel component to be used similar to how Anymo's carousels are used for its end-users. Completed as a interview-project for Anymo.


### Installation

#### 1. Install the UnflowInterviewApp package.
#### 2. Import UnflowInterviewApp in the Swift file you want to use the carousel in as shown below.
<img width="542" alt="Screen Shot 2021-10-16 at 5 18 02 PM" src="https://user-images.githubusercontent.com/64529785/137602362-4ab4119e-336b-4c9b-8533-f98be7889aa4.png">

#### 3. Instantiate a CarouselItem/s object by passing in the header and body text as well as the image names for the background and optional center display image such as below.
`let carousels = [CarouselItem.init(headerText: "Introducing Audio Rooms", bodyText: .constant("We all know video calls can get tiring, so we've introduced a new form of room, just for audio.\nShare stories, music, or just listen to ambient sound while working from home.")]`


#### 4. Instantiate a Carousel object by passing in your array of CarouselItem/s and optional custom button texts for the main button as well as the last page button and place it in the body of your view as shown in the image below.
<img width="502" alt="Screen Shot 2021-10-16 at 5 21 48 PM" src="https://user-images.githubusercontent.com/64529785/137602422-65e6667a-ccca-46a5-972c-a34045212709.png">


### VOILA! You should have a fully functioning carousel view thats completely integratable in iOS 13 onwards with SwiftUI similar to the one shown here.
 ![combine_images](https://user-images.githubusercontent.com/64529785/137602570-7bc48a97-6ae0-4cb5-85dd-7c925bb60963.jpg)

### Potential Improvements (exceeding time constraint)
- Add support for previous iOS versions.
- Allow for more dynamism for carousel and its items aside from only having header and body texts and background and 1 display image and one button at the bottom.
- Extra animations when moving between views etc.
- Add extra test cases for current test suite as well as including UI tests.
- Allow for more action buttons such as navigating to different part of your app or open a website up when clicking buttons and being able to extend the Carousel to handle this.
