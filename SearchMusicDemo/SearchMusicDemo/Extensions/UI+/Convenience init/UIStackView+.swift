
import UIKit

extension UIStackView {

	convenience init(
		axis: NSLayoutConstraint.Axis,
		spacing: CGFloat,
		distribution: UIStackView.Distribution = .fill
	) {
		self.init()

		self.axis = axis
		self.spacing = spacing
		self.distribution = distribution
	}

}
