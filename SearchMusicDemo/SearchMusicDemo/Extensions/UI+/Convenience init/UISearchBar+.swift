
import UIKit

extension UISearchBar {

	convenience init(
		placeholder: String = "",
		showsCancelButton: Bool
	) {
		self.init()

		self.placeholder = placeholder
		self.showsCancelButton = showsCancelButton
	}

}
