// Meal.swift
// Derek Liemohn

import Foundation
import Kanna

struct menuItem {
	var dish: String
	var description: String
}

class Menu {
	var meal: String
	var startTime: String;
	var endTime: String;
	var items: [String];

	init(menu: XMLElement) throws {
		guard let h2 = menu.xpath("//h2@[class='panel__title site-panel__daypart-panel-title']").first else {
			throw ParsingError.HTMLError
		}
		guard let mealtime = h2.text else {
			throw ParsingError.HTMLError
		}
		getMenuItems(html: menu)
	}
	
	func getMenuItems(html: XMLElement) {
		
	}
}
