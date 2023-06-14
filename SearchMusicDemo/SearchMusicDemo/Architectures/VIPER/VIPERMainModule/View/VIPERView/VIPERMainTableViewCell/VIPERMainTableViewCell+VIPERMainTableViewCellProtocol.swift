
import Foundation

extension VIPERMainTableViewCell: VIPERMainTableViewCellProtocol {

	func configure(_ model: VIPERProduct) {

		if model.artworkUrl100 != "" {

			if let urlString = model.artworkUrl100 {
				fetchData.loadImageFrom(stringURL: urlString) { [weak self] picture in
					guard let self else { return }
					self.image.backgroundColor = .systemBackground
					self.image.image = picture
				}
			}

		} else {
			image.backgroundColor = .secondarySystemBackground
			image.image = nil
		}

		artistNameLabel.text = model.artistName
		trackNameLabel.text = model.trackName

		viewsCount.text = "Views: \(model.viewsCount?.views ?? 999)"

	}

}
