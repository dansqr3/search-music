
import UIKit

extension UIActivityIndicatorView {

	convenience init(
		style: UIActivityIndicatorView.Style,
		alpha: CGFloat = 1
	) {
		self.init()

		self.style = style
		self.alpha = alpha
	}

}
