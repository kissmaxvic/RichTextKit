//
//  RichTextViewRepresentable.swift
//  RichTextKit
//
//  Created by Daniel Saidi on 2024-03-04.
//  Copyright © 2024 Daniel Saidi. All rights reserved.
//
import SwiftUI
import UIKit


struct TextKit1TextView: UIViewRepresentable {
    @Binding var text: NSAttributedString

    func makeUIView(context: Context) -> UITextView {
        // Создаем UITextView с использованием TextKit 1
        if #available(iOS 16, *) {
            let textView = UITextView(usingTextLayoutManager: false)
        }
        textView.isEditable = true
        textView.isScrollEnabled = true
        textView.attributedText = text
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.attributedText = text
    }
}

#if macOS
import AppKit

/// This typealias bridges UIKit & AppKit native text views.
public typealias RichTextViewRepresentable = NSTextView
#endif

#if iOS || os(tvOS) || os(visionOS)
import UIKit

/// This typealias bridges UIKit & AppKit native text views.
public typealias RichTextViewRepresentable = TextKit1TextView()
#endif


