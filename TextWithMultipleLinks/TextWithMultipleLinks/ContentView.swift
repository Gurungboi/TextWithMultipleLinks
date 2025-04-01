//
//  ContentView.swift
//  TextWithMultipleLinks
//
//  Created by Sunil Gurung on 1/4/2025.
//

import SwiftUI

struct ContentView: View {

    // MARK: - Properties

    let fullText: String = "Google is a search engine and Apple is a company"

    // MARK: - States

    @State private var didClickedOnGoogle: Bool = false
    @State private var didClickedOnApple: Bool = false

    var body: some View {
        VStack {
            TextWithMultipleLinks(
                fullText: fullText,
                links: [
                    (
                        "Google", {
                            didClickedOnGoogle.toggle()
                        }),
                    ("Apple", {
                        didClickedOnApple.toggle()
                    })
                ]
            )
            .sheet(isPresented: $didClickedOnGoogle) {
                GoogleSheetView()
            }
            .sheet(isPresented: $didClickedOnApple) {
                AppleSheetView()
            }
        }
    }
}

struct GoogleSheetView: View {

    // MARK: - Environment

    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            Text("You tapped on Google!")
                .font(.title)
                .padding()
            Button("Dismiss") {
                dismiss()
            }
            .padding()
        }
    }
}

struct AppleSheetView: View {

    // MARK: - Environment

    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            Text("You tapped on Apple!")
                .font(.title)
                .padding()
            Button("Dismiss") {
                dismiss()
            }
            .padding()
        }
    }
}

#if DEBUG
#Preview {
    ContentView()
}
#endif

