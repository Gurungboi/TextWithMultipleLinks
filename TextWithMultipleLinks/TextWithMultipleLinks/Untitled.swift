//
//  TextWithMultipleLinks.swift
//  TextWithMultipleLinks
//
//  Created by Sunil Gurung on 1/4/2025.
//


import SwiftUI

struct TextWithMultipleLinks: View {

    // MARK: - Properties

    private let fullText: String
    private let links: [(text: String, action: (() -> Void)?)]
    private let textStyle: Font
    private let textColor: Color

    // MARK: - Initialiser
    init(
        fullText: String,
        textStyle: Font = .body,
        textColor: Color = .black,
        links: [(text: String, action: (() -> Void)?)]
    ) {
        self.fullText = fullText
        self.textStyle = textStyle
        self.textColor = textColor
        self.links = links
    }

    // MARK: - UI Body

    var body: some View {
        VStack(alignment: .leading) {
            renderTextWithLinks()
                .font(textStyle)
                .lineSpacing(4)
                .accessibilityElement(children: .combine)
        }
    }

    // MARK: - Helper to Render Attributed Text with Links

    private func renderTextWithLinks() -> some View {
        var attributedString = AttributedString(fullText)
        attributedString.foregroundColor = textColor

        // Add attributes for each link
        for (index, link) in links.enumerated() {
            if let range = findCaseInsensitiveRange(of: link.text, in: fullText) {

                let matchedText = String(fullText[range])

                if let attrRange = attributedString.range(of: matchedText) {
                    attributedString[attrRange].foregroundColor = .blue
                    attributedString[attrRange].link = URL(string: "action://link/\(index)")
                }
            }
        }

        return Text(attributedString)
            .environment(\.openURL, OpenURLAction { url in
                if
                    let scheme = url.scheme,
                    scheme == "action",
                    let idx = Int(url.lastPathComponent),
                    idx >= 0 && idx < links.count {
                    links[idx].action?()
                }
                return .handled
            })
    }

    // MARK: - Helper to Find Case-Insensitive Range

    private func findCaseInsensitiveRange(of substring: String, in string: String) -> Range<String.Index>? {
        return string.range(
            of: substring,
            options: [.caseInsensitive]
        )
    }
}
