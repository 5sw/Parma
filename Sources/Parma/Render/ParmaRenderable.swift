//
//  ParmaRenderable.swift
//  Parma
//
//  Created by leonard on 8/15/20.
//
//  Copyright (c) 2020 Leonard Chan <wxclx98@gmail.com>
//
//  MIT license, see LICENSE file for details

import SwiftUI

public protocol ParmaRenderable {
    func heading(level: HeadingLevel?, textView: Text) -> Text

    func paragraph(text: String) -> Text

    func plainText(_ text: String) -> Text

    func strong(textView: Text) -> Text

    func emphasis(textView: Text) -> Text

    func link(textView: Text, destination: String?) -> Text

    func code(_ text: String) -> Text

    func headingBlock(level: HeadingLevel?, view: AnyView) -> AnyView

    func paragraphBlock(view: AnyView) -> AnyView

    func listItem(view: AnyView) -> AnyView

    func imageView(with urlString: String) -> AnyView
}

extension ParmaRenderable {
    func plainText(_ text: String) -> Text {
        Text(text)
    }
    
    func strong(textView: Text) -> Text {
        textView.bold()
    }
    
    func emphasis(textView: Text) -> Text {
        textView.italic()
    }
    
    func link(textView: Text, destination: String?) -> Text {
        return textView
    }
    
    func code(_ text: String) -> Text {
        Text(text).font(.system(.body, design: .monospaced))
    }
    
    func heading(level: HeadingLevel?, textView: Text) -> Text {
        switch level {
        case .one:
            return textView.font(.largeTitle)
        case .two:
            return textView.font(.title)
        case .three:
            return textView.font(.title2)
        default:
            return textView.font(.title3)
        }
    }
    
    func paragraph(text: String) -> Text {
        Text(text).font(.body)
    }

    func headingBlock(level: HeadingLevel?, view: AnyView) -> AnyView {
        AnyView(view.padding(.bottom, 12))
    }
    
    func paragraphBlock(view: AnyView) -> AnyView {
        AnyView(view.padding(.bottom, 8))
    }
    
    func listItem(view: AnyView) -> AnyView {
        let bullet = "•"
        return AnyView(
            HStack(alignment: .top, spacing: 4) {
                Text(bullet)
                view
            }
        )
    }
    
    func imageView(with urlString: String) -> AnyView {
        return AnyView(
            Text(urlString)
        )
    }
}
