//error nil

import UIKit

class PinkButton: UIButton {
    init(action: UIAction, color: UIColor = .systemPink) {
        super.init(frame: .zero)
        addAction(action, for: .touchUpInside)
        backgroundColor = color
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
