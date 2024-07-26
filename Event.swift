//
//  Event.swift
//  Neighborhood Connect
//
//  Created by Andy Delgado on 7/18/24.
//

import Foundation
import FirebaseDatabase

struct Event: Identifiable {
    var id: String
    var name: String
    var type: String
    var description: String
    var address: String
    var date: Date
    var attendees: [String]

    init(id: String, name: String, type: String, description: String, address: String, date: Date, attendees: [String]) {
        self.id = id
        self.name = name
        self.type = type
        self.description = description
        self.address = address
        self.date = date
        self.attendees = attendees
    }

    init?(snapshot: DataSnapshot) {
        guard let value = snapshot.value as? [String: Any],
              let name = value["name"] as? String,
              let type = value["type"] as? String,
              let description = value["description"] as? String,
              let address = value["address"] as? String,
              let timestamp = value["date"] as? TimeInterval,
              let attendees = value["attendees"] as? [String] else {
            return nil
        }

        self.id = snapshot.key
        self.name = name
        self.type = type
        self.description = description
        self.address = address
        self.date = Date(timeIntervalSince1970: timestamp)
        self.attendees = attendees
    }

    func toAnyObject() -> Any {
        return [
            "name": name,
            "type": type,
            "description": description,
            "address": address,
            "date": date.timeIntervalSince1970,
            "attendees": attendees
        ]
    }
}
