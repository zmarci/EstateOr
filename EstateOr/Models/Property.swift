//
//  Property.swift
//  EstateOr
//
//  Created by Marton Zatrok on 2017. 07. 20..
//  Copyright © 2017. Marton Zatrok. All rights reserved.
//

import Foundation

struct Property {
    
    var id: Int?
    var address: String?
    var lat: Double?
    var lon: Double?
    var areaM2: Double?
    var roomNr: Double?
    var floorNr: Int?
    var building: Building?
    var hasBalcony: Bool?
    var currentTenant: Tenant? {
        return nil
    }
 
    init(_id: Int, _address: String, _lat: Double, _lon: Double, _areaM2: Double, _roomNr: Double, _floorNr: Int, _building: Building? = nil, _hasBalcony: Bool) {
        id = _id
        address = _address
        lat = _lat
        lon = _lon
        areaM2 = _areaM2
        roomNr = _roomNr
        floorNr = _floorNr
        building = _building
        hasBalcony = _hasBalcony
    }
    
    static func allProperties() -> [Property] {
     
        var tempPropertyList: [Property] = []
        
        for index in 0...1 {
            
            let dummyProperty = Property(_id: index, _address: "Boston", _lat: 13.4 * Double(index), _lon: 16.1 * Double(index), _areaM2: 45.5 * Double(index), _roomNr: 1, _floorNr: 4, _building: nil, _hasBalcony: false)
            
            tempPropertyList.append(dummyProperty)
            
        }
        
        return tempPropertyList
    }
    
    func currentContract() -> PropertyTenantContract? {
       
        guard let id = id else {
            
            return nil
            
        }
        return PropertyTenantContract.currentContract(forPropertyId: id)
    }
}
