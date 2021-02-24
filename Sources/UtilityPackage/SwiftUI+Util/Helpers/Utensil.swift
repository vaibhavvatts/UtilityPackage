

import Foundation
import SwiftUI


//   Enumeration for Views in SwiftUI. Used for creating views from ForEach.
/// - Parameters : array of generic type.
/// Passing input  as an array of models

struct EnumeratedForEach<T, ContentView: View>: View {
    let data: [T]
    let content: (Int, T) -> ContentView
    
    init(_ data: [T], @ViewBuilder content: @escaping (Int, T) -> ContentView) {
        self.data = data
        self.content = content
    }
    
    var body: some View {
        ForEach(Array(self.data.enumerated()), id: \.offset) { idx, item in
            self.content(idx, item)
        }
    }
}

extension View {
    @ViewBuilder func isHidden(_ shouldHide: Bool) -> some View {
        switch shouldHide {
        case true: self.hidden()
        case false: self
        }
    }
}
