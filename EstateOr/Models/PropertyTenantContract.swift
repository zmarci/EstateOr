//
//  PropertyTenantContract.swift
//  EstateOr
//
//  Created by Marton Zatrok on 2017. 07. 20..
//  Copyright © 2017. Marton Zatrok. All rights reserved.
//

import Foundation

struct PropertyTenantContract {
    
    var id: Int?
    var tenantId: Int?
    var propertyId: Int?
    var startDate: Date?
    var endDate: Date?
    var paymentPeriod: String?
    var paymentAmount: Double?
    var currencyCode: String?
    
    
    init(_id: Int, _tenantId: Int, _propertyId: Int, _startDate: Date, _endDate: Date? = nil, _paymentPreriod: String, _paymentAmount: Double, _currencyCode: String) {
       
        id = _id
        tenantId = _tenantId
        propertyId = _propertyId
        startDate = _startDate
        endDate = _endDate
        paymentPeriod = _paymentPreriod
        paymentAmount = _paymentAmount
        currencyCode = _currencyCode
        
    }
    
    static func currentContract(forPropertyId newPropertyId: Int) -> PropertyTenantContract
    {
        //find current contract that is currently active for a property, given its id (Date() > startDate && Date() < endDate)
        
        
        return PropertyTenantContract(_id: 1, _tenantId: 1, _propertyId: newPropertyId, _startDate: Date(), _endDate: nil, _paymentPreriod: "P1M", _paymentAmount: 300, _currencyCode: "EUR")
    }
    
    static func currentContract(forTenantId newTenantId: Int) -> PropertyTenantContract
    {
        return PropertyTenantContract(_id: 1, _tenantId: newTenantId, _propertyId: 1, _startDate: Date(), _endDate: nil, _paymentPreriod: "P1M", _paymentAmount: 300, _currencyCode: "EUR")
    }
}
