//
//  Tenant.swift
//  EstateOr
//
//  Created by Marton Zatrok on 2017. 07. 20..
//  Copyright © 2017. Marton Zatrok. All rights reserved.
//

import Foundation

struct Tenant {
    
    var id: Int?
    var firstName: String?
    var lastName: String?
    var birthDate: Date?
    var contract: PropertyTenantContract? {
    
        return PropertyTenantContract(_id: 1, _tenantId: 1, _propertyId: 1, _startDate: Date(), _paymentPreriod: "P1M", _paymentAmount: 300, _currencyCode: "EUR")
        
    }
    
    init(_id: Int, _firstName: String?, _lastName: String?, _birthDate: Date?) {
        id = _id
        firstName = _firstName
        lastName = _lastName
        birthDate = _birthDate
    }
    
}
