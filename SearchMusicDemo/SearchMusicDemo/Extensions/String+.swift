
import Foundation

extension String {

	func formate(to formatDate: String) -> Self {

		let calendar = Calendar.current
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

		guard let date = formatter.date(from: self),

			  let newDate = calendar.date(
				from: calendar.dateComponents(
					[.year, .month, .day],
					from: date
				)
			  ) else { return self }

		let newDateFormatter = DateFormatter()
		newDateFormatter.dateFormat = formatDate

		let result = newDateFormatter.string(from: newDate)

		return result

	}

}
