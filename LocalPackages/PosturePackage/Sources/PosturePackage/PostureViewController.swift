//
//  PostureViewController.swift
//  PosturePackage
//

import Combine
import SwiftUI
import UIKit

public final class PostureViewController: UIViewController {
    // MARK: - Properties

    private var postureInteractionEvents = PostureInteractionEvents()
    private var hostingController: UIHostingController<PostureEntryPointView>!
    private var cancellables = [AnyCancellable]()
    public weak var delegate: PostureViewControllerDelegate?

    // MARK: - Initializers

    public init() {
        super.init(nibName: nil, bundle: nil)

        let postureEntryPointView = PostureEntryPointView(postureInteractionEvents: postureInteractionEvents)

        hostingController = UIHostingController(rootView: postureEntryPointView)
        addChild(hostingController)
        hostingController.didMove(toParent: self)
        view.addSubview(hostingController.view)

        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])

        if #available(iOS 16.0, *) {
            hostingController.sizingOptions = [.intrinsicContentSize]
        } else {
            hostingController.view.setNeedsUpdateConstraints()
        }

        postureInteractionEvents.$startButtonIsTapped.dropFirst().sink { [unowned self] _ in
            delegate?.postureViewControllerStartButtonDidTapped(viewController: self)
        }.store(in: &cancellables)

        postureInteractionEvents.$settingsButtonIsTapped.dropFirst().sink { [unowned self] _ in
            delegate?.postureViewControllerSettingsButtonDidTapped(viewController: self)
        }.store(in: &cancellables)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("This class does not support NSCoder")
    }
}
