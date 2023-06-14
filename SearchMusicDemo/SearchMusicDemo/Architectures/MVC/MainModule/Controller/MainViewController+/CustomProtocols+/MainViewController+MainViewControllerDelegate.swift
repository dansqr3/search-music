
import Foundation
import UIKit

extension MainViewController: MainViewControllerDelegate {

	func startActivityIndicator() {
		mainView.indicatorBackgroundView.alpha = 0.7
		mainView.activityIndicator.alpha = 1
		mainView.activityIndicator.startAnimating()
	}

	func stopActivityIndicator() {
		mainView.indicatorBackgroundView.alpha = 0
		mainView.activityIndicator.stopAnimating()
		mainView.activityIndicator.alpha = 0
	}

}
