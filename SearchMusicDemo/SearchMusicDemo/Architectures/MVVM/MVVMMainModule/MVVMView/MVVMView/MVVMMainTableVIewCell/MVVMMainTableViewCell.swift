
import Foundation
import UIKit

class MVVMMainTableViewCell: UITableViewCell {

	var artistNameLabel: UILabel!
	var trackNameLabel: UILabel!
	var image: UIImageView!
	var stackView: UIStackView!
	var activityIndicator: UIActivityIndicatorView!
	var viewsCount: UILabel!

	let fetchData = FetchData()

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		setupViews()
		setupHierarchy()
		setupConstraints()

	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupViews() {

		artistNameLabel = UILabel(
			textColor: .label,
			font: .systemFont(ofSize: 16),
			numberOfLines: 2
		)

		trackNameLabel = UILabel(
			textColor: .label,
			font: .systemFont(ofSize: 16),
			numberOfLines: 2
		)

		stackView = UIStackView(
			axis: .vertical,
			spacing: CGFloat(Constants.distance / 2)
		)

		activityIndicator = UIActivityIndicatorView(style: .medium)

		image = UIImageView(
			backgroundColor: .systemBackground,
			contentMode: .scaleAspectFit,
			cornerRadius: 4,
			clipsToBounds: true
		)

		viewsCount = UILabel(
			text: "Views: 999",
			textColor: .systemGray,
			font: .systemFont(ofSize: 12)
		)

	}

	private func setupHierarchy() {

		stackView.addArrangedSubview(artistNameLabel)
		stackView.addArrangedSubview(trackNameLabel)
		stackView.addArrangedSubview(viewsCount)

		contentView.addSubview(image)
		contentView.addSubview(stackView)

		image.addSubview(activityIndicator)

	}

	private func setupConstraints() {

		[
			image,
			stackView,
		].forEach {
			$0.translatesAutoresizingMaskIntoConstraints = false
		}

		NSLayoutConstraint.activate([

			image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.distance),
			image.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -Constants.distance),
			image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.distance),
			image.heightAnchor.constraint(equalToConstant: Constants.Size.Cell.height),
			image.widthAnchor.constraint(equalToConstant: Constants.Size.Cell.width),

			stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.distance),
			stackView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -Constants.distance),
			stackView.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: Constants.distance),
			stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.distance),

		])

	}

}
