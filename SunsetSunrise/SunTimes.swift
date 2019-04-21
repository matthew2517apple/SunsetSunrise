//
//  SunTimes.swift
//  SunsetSunrise
//
//  Created by MJC-iCloud on 4/3/19.
//  Copyright © 2019 Matthew. All rights reserved.
//

import Foundation

struct SunTimes: Decodable {
    let sunrise: String
    let sunset: String
    
    enum CodingKeys: String, CodingKey {
        case sunrise
        case sunset
    }
}

struct  Results: Decodable {
    let results: SunTimes
}


extension SunTimes {
    
    static let utcDateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "hh:mm:ss a"
        df.timeZone = TimeZone(abbreviation: "UTC")
        return df
    }()
    
    static let localDateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.calendar = NSCalendar.current
        df.timeZone = TimeZone.current
        df.timeStyle = .medium
        return df
    }()
    
    public init(from decoder: Decoder) {
        
        let container = try! decoder.container(keyedBy: CodingKeys.self)
        let sunriseUTCString = try! container.decode(String.self, forKey: CodingKeys.sunrise)
        let sunsetUTCString = try! container.decode(String.self, forKey: CodingKeys.sunset)
        
        let sunriseUTCDate = SunTimes.utcDateFormatter.date(from: sunriseUTCString)
        let sunsetUTCDate = SunTimes.utcDateFormatter.date(from: sunsetUTCString)
        
        sunrise = SunTimes.localDateFormatter.string(from: sunriseUTCDate!)
        sunset = SunTimes.localDateFormatter.string(from: sunsetUTCDate!)
        
        print("INIT WAS CALLED.")
    }
    
    //public init() {
    //    let decoder = JSONDecoder()
    //    self.init(from: decoder)
    //}
}
