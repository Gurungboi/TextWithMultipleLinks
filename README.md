# 📝 TextWithMultipleLinks

[![Swift](https://img.shields.io/badge/Swift-5.9-orange)](https://swift.org)
[![Platform](https://img.shields.io/badge/Platform-iOS-blue)](https://developer.apple.com/ios)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)

`TextWithMultipleLinks` is a **SwiftUI** component designed to simplify the process of embedding multiple clickable links within a single block of text. This component allows you to dynamically highlight specific substrings as links, apply custom styles (font, color, etc.), and associate actions with those links. It eliminates the need to use multiple `Text` views for each link, making your code cleaner, more efficient, and easier to maintain.

This solution is ideal for scenarios such as legal disclaimers, terms of service, or any other text that requires interactive elements.

---

## 🌟 Features

- **Dynamic Link Highlighting**: Automatically detects and highlights specified substrings within the text as clickable links.
- **Customizable Styling**: Supports custom font styles, text colors, and link colors.
- **Action Binding**: Each link can be associated with a unique action, enabling flexible interactivity.
- **Case-Insensitive Matching**: Links are matched case-insensitively, ensuring robustness in text processing.
- **Accessibility Support**: Combines all text elements into a single accessibility element for better screen reader support.

---

## 🚀 Usage

### Basic Example

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        TextWithMultipleLinks(
            fullText: "By continuing, you agree to our Terms of Service and Privacy Policy.",
            textStyle: .body,
            textColor: .black,
            links: [
                (text: "Terms of Service", action: {
                    print("Terms of Service clicked!")
                }),
                (text: "Privacy Policy", action: {
                    print("Privacy Policy clicked!")
                })
            ]
        )
    }
}
```

### Explanation

1. **`fullText`**: The complete string that contains both regular text and the substrings to be highlighted as links.
2. **`textStyle`**: The font style applied to the entire text (default is `.body`).
3. **`textColor`**: The color of the non-link text (default is `.black`).
4. **`links`**: An array of tuples where each tuple specifies:
   - `text`: The substring to be highlighted as a link.
   - `action`: A closure executed when the link is tapped.

---

## 🎨 Customization

### Font Style

You can customize the font style by passing a different `Font` value to the `textStyle` parameter:

```swift
TextWithMultipleLinks(
    fullText: "Welcome to our platform!",
    textStyle: .headline,
    textColor: .gray,
    links: [
        (text: "platform", action: {
            print("Platform link clicked!")
        })
    ]
)
```

### Link Color

The default link color is blue, but you can modify it by adjusting the `foregroundColor` property in the `renderTextWithLinks` method.

---

## ⚙️ Implementation Details

### Key Components

1. **Attributed Strings**:
   - The component uses `AttributedString` to apply custom attributes (e.g., color, link) to specific ranges of the text.
   - Links are assigned a custom URL scheme (`action://link/<index>`) to identify which link was tapped.

2. **OpenURLAction**:
   - The `OpenURLAction` environment is used to handle link taps. When a link is clicked, the corresponding action is executed based on the URL's path.

3. **Case-Insensitive Matching**:
   - The `findCaseInsensitiveRange` helper function ensures that links are matched regardless of case, improving flexibility.

4. **Accessibility**:
   - The `accessibilityElement(children: .combine)` modifier ensures that all text elements are treated as a single accessibility element, improving usability for screen readers.

---

## 📊 Benefits

- **Code Efficiency**: Reduces boilerplate code by handling multiple links in a single `Text` view.
- **Consistency**: Ensures consistent styling and behavior across all links.
- **Flexibility**: Easily adaptable to various use cases, such as legal documents, FAQs, or promotional content.

---

## 🛠 Future Enhancements

- **Support for URL Links**: Extend functionality to handle external URLs in addition to custom actions.
- **Underline for Links**: Add an option to underline links for better visual distinction.
- **Localization Support**: Ensure compatibility with localized strings and right-to-left languages.

---

## 🤝 Contributing

Contributions are welcome! If you have ideas for improvements or find any issues, feel free to open a pull request or submit an issue.

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

## 📢 Acknowledgments

- Inspired by the need for a clean and reusable solution for embedding multiple links in SwiftUI text.
- Built with ❤️ using **SwiftUI**.

---

Feel free to star ⭐ this repository if you find it useful! 🚀
