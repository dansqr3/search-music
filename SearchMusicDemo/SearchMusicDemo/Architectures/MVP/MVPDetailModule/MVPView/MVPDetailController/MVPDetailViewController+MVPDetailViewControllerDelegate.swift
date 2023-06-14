
import Foundation

extension MVPDetailViewController: MVPDetailViewControllerDelegate {

	func labelTappedAction(urlString: String?) {

		mvpDetailPresenter.labelTappedAction(urlString: urlString)

	}

}
