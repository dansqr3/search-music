
import UIKit

class VIPERDetailView: UIView {

	weak var viperDetailViewControllerDelegate: VIPERDetailViewControllerDelegate?

	var image: UIImageView!
	var title: UILabel!

	var subStackView1: UIStackView!
	var subStackView2: UIStackView!

	var collectionNameLabel: UILabel!
	var releaseDateLabel: UILabel!
	var trackViewURLLabel: UILabel!

	var stackView: UIStackView!

	override init(frame: CGRect) {
		super.init(frame: frame)

		setupViews()
		setupHierarchy()
		setupConstraints()
		addGesture()

	}

	override func layoutSubviews() {
		super.layoutSubviews()

		setupConstraints()

	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupViews() {

		backgroundColor = .systemBackground

		image = UIImageView(
			backgroundColor: .systemBackground,
			contentMode: .scaleAspectFit,
			cornerRadius: 8,
			clipsToBounds: true
		)

		title = UILabel(
			textColor: .label,
			font: .systemFont(
				ofSize: 18,
				weight: .semibold
			)
		)

		subStackView1 = UIStackView(
			axis: .horizontal,
			spacing: 8
		)

		subStackView2 = UIStackView(
			axis: .vertical,
			spacing: 4,
			distribution: .fillProportionally
		)

		collectionNameLabel = UILabel(
			textColor: .label,
			font: .systemFont(ofSize: 16),
			numberOfLines: 2
		)

		releaseDateLabel = UILabel(
			textColor: .label,
			font: .systemFont(ofSize: 16)
		)

		trackViewURLLabel = UILabel(
			textColor: .label,
			font: .systemFont(ofSize: 16)
		)

		stackView = UIStackView(
			axis: .vertical,
			spacing: CGFloat(Constants.distance)
		)

	}

	private func setupHierarchy() {

		subStackView1.addArrangedSubview(image)
		subStackView1.addArrangedSubview(title)

		stackView.addArrangedSubview(subStackView1)

		stackView.addArrangedSubview(collectionNameLabel)
		stackView.addArrangedSubview(releaseDateLabel)
		stackView.addArrangedSubview(trackViewURLLabel)

		addSubview(stackView)

	}

	private func setupConstraints() {

		[
			image,
		 stackView
		].forEach {
			$0.translatesAutoresizingMaskIntoConstraints = false
		}

		NSLayoutConstraint.activate([

			image.widthAnchor.constraint(equalToConstant: Constants.Size.Image.width),
			image.heightAnchor.constraint(equalToConstant: Constants.Size.Image.height),

			stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
			stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
			stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),

		])

	}

	private func addGesture() {

		let tapGesture = UITapGestureRecognizer(target: self, action: #selector(trackViewURLLabelAction))
		trackViewURLLabel.isUserInteractionEnabled = true
		trackViewURLLabel.addGestureRecognizer(tapGesture)

	}

	private func getScreenWidth() -> CGFloat {
		let scenes = UIApplication.shared.connectedScenes
		guard let windowScene = scenes.first as? UIWindowScene else { return 370 }
		let window = windowScene.windows.first
		guard let width = window?.safeAreaAspectFitLayoutGuide.layoutFrame.width else { return 370 }
		return width
	}

	@objc private func trackViewURLLabelAction() {

		let sender = trackViewURLLabel.text
		viperDetailViewControllerDelegate?.labelTappedAction(urlString: sender)

	}

}
