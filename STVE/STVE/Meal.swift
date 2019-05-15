// Meal.swift
// Derek Liemohn

import Foundation
import Kanna


class Menu {
	var meal: String
	var timings: DateInterval
	var items: [MenuItem];

	init(menu: XMLElement) throws {
		guard let h2 = menu.xpath("//h2@[class='panel__title site-panel__daypart-panel-title']").first else {
			throw ParsingError.HTMLError
		}
		guard let mealtime = h2.text else {
			throw ParsingError.HTMLError
		}
		guard let time_block = menu.xpath("//div@[class=\"site-panel__daypart-tim\"']").first else {
			throw ParsingError.HTMLError
		}
		guard let timestr = time_block.text else {
			throw ParsingError.HTMLError
		}
		let times = timestr.components(separatedBy: " - ")
		parseTimeInfo(start: matches[0], end: matches[1])
		getMenuItems(html: menu)
	}
	
	func parseTimeInfo(start: String, end: String) {
		let date = NSDate()
		let fillVals = [.Year, .Month, .Day]
		let startComp = NSCalendar.currentCalendar().components(fillVals, fromDate: date)
		let endComp = NSCalendar.currentCalendar().components(fillVals, fromDate: date)
		let startDate = parseDate(timeStr: start, template: startComp)
		let endDate = parseDate(timeStr: end, template: endComp)
		timings = DateInterval(start: startDate, end: endDate)
	}
	
	func parseDate(timeStr: String, template: DateComponents) -> Date {
		let comp = date.components(separatedBy: " ")
		let time = comp[0].components(separatedBy: ":"); 
		let period = comp[1]
		if let hr = (Int(time[0]))? {
			if (period == "pm") {
				hr += 12
			}
			template.hour = hr
		}
		if let min = (Int(time[1]))? {
			template.minute = min
		}
		return Calendar.current.date(from: template)
	}
	
	func getMenuItems(html: XMLElement) {
		for item in html.xpath("//div@[class='site-panel__daypart-item-container']") {
			items.append(MenuItem(item));
		}
	}
}
