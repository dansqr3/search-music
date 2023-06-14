
import UIKit

extension UIView {

	convenience init(
		backgroundColor: UIColor,
		alpha: CGFloat = 0
	) {
		self.init()

		self.backgroundColor = backgroundColor
		self.alpha = alpha
	}

}
