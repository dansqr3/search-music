
import Foundation

extension VIPERDetailPresenter: VIPERDetailViewControllerOutput {

	func configure(_ content: VIPERProduct) {

		viperDetailInteractorInput.configure(content)

	}

	func labelTappedAction(urlString: String?) {

		viperDetailInteractorInput.labelTappedAction(urlString: urlString)

	}

}
