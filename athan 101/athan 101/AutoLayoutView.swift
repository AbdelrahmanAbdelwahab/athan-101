//
//  AutoLayoutView.swift
//  athan 101
//
//  Created by ABDELWAHAB on 09/04/22.
//

import UIKit

open class AutolayoutView: UIView {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setup()
    }
    
    // To override for custom configuration
    open func configure() { }
    
    private func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        guard let view = UINib(nibName: self.nibName(), bundle: self.bundle()).instantiate(withOwner: self, options: nil).first as? UIView else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        NSLayoutConstraint.activate([view.topAnchor.constraint(equalTo: self.topAnchor),
                                     view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                                     view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     view.trailingAnchor.constraint(equalTo: self.trailingAnchor)])
        self.layoutIfNeeded()
        self.configure()
    }
    
    // Must be override
    open func nibName() -> String {
        "AutolayoutView"
    }
    
    open func bundle() -> Bundle {
        Bundle(for: Self.self)
    }
}
