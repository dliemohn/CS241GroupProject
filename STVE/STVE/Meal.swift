// Meal.swift
// Derek Liemohn
//
//
//

import Foundation
import Kanna

class Meal {
  let startTime: NSString;
  let endTime: NSString;
  let venue: Venue;
  let items: [NSString];
  let name: NSString;
  let url: NSString;

    init(start: NSString, end: NSString, ven: Venue, html: NSString, title: NSString){
     startTime = start;
     endTime = end;
     venue = ven;
     url = html;
     name = title;
     parseItems;
   }

   func parseItems() -> Void{
   let metadata = try HTML(html: url, encoding: .utf8)

   }

}
