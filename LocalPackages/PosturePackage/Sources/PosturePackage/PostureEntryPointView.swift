//
//  PostureEntryPointView.swift
//  PosturePackage
//

import SwiftUI

public struct PostureEntryPointView: View {
    // MARK: - Properties

    private var postureInteractionEvents: PostureInteractionEvents

    public var body: some View {
        VStack {
            Button(action: { postureInteractionEvents.startButtonIsTapped = true }, label: {
                Text("Start")
                    .frame(maxWidth: .infinity)
            })
            .buttonStyle(.borderedProminent)

            Button(action: { postureInteractionEvents.settingsButtonIsTapped = true }, label: {
                Text("Settings")
                    .frame(maxWidth: .infinity)
            })
            .buttonStyle(.borderless)
        }
        .padding()
    }

    // MARK: - Initializers

    public init(postureInteractionEvents: PostureInteractionEvents) {
        self.postureInteractionEvents = postureInteractionEvents
    }
}

#Preview {
    PostureEntryPointView(postureInteractionEvents: PostureInteractionEvents())
}
