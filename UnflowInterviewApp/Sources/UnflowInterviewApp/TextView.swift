//
//  TextView.swift
//  
//
//  Created by Danesh Rajasolan on 2021-10-16.
//

import SwiftUI

struct TextView: UIViewRepresentable {
    @Binding var text: String
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        UITextView.appearance().backgroundColor = .clear
        textView.font = UIFont.systemFont(ofSize: 20, weight: .light)
        textView.textAlignment = .center
        textView.autocapitalizationType = .sentences
        textView.isEditable = false
        textView.isUserInteractionEnabled = true
        
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}

//struct TextView_Previews: PreviewProvider {
//    static var previews: some View {
//        TextView(text: .constant("Fingers crossed TextEditor eventually back-supports iOS 13 as well."))
//    }
//}
