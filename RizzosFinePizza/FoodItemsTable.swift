//
//  FoodItemsTable.swift
//  MySampleApp
//
//
// Copyright 2016 Amazon.com, Inc. or its affiliates (Amazon). All Rights Reserved.
//
// Code generated by AWS Mobile Hub. Amazon gives unlimited permission to 
// copy, distribute and modify it.
//
// Source code generated from template: aws-my-sample-app-ios-swift v0.2
//

import Foundation
import UIKit
import AWSDynamoDB
import AWSMobileHubHelper
class FoodItemsTable: NSObject, Table {
    
    var tableName: String
    var partitionKeyName: String
    var sortKeyName: String?
    var model: AWSDynamoDBObjectModel
    var indexes: [Index]
    var orderedAttributeKeys: [String] {
        return produceOrderedAttributeKeys(model)
    }
    var tableDisplayName: String {
        return "FoodItems"
    }
    
    override init() {
        model = FoodItems()
        
        tableName = model.classForCoder.dynamoDBTableName()
        partitionKeyName = model.classForCoder.hashKeyAttribute()
        indexes = [
            FoodItemsPrimaryIndex(),
            FoodItemsTitle(),
        ]
        if (model.classForCoder.respondsToSelector("rangeKeyAttribute")) {
            sortKeyName = model.classForCoder.rangeKeyAttribute!()
        }
        super.init()
    }
    
    /**
     * Converts the attribute name from data object format to table format.
     *
     * - parameter dataObjectAttributeName: data object attribute name
     * - returns: table attribute name
     */

    func tableAttributeName(dataObjectAttributeName: String) -> String {
        return FoodItems.JSONKeyPathsByPropertyKey()[dataObjectAttributeName] as! String
    }
    
    func getItemDescription() -> String {
        return "Find Item with userId = '\(AWSIdentityManager.defaultIdentityManager().identityId!)' and itemId = '\("demo-itemId-500000")'."
    }
    
    func getItemWithCompletionHandler(completionHandler: (response: AWSDynamoDBObjectModel?, error: NSError?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.defaultDynamoDBObjectMapper()
        objectMapper.load(FoodItems.self, hashKey: AWSIdentityManager.defaultIdentityManager().identityId!, rangeKey: "demo-itemId-500000", completionHandler: {(response: AWSDynamoDBObjectModel?, error: NSError?) -> Void in
            dispatch_async(dispatch_get_main_queue(), {
                completionHandler(response: response, error: error)
            })
        })
    }
    
    func scanDescription() -> String {
        return "Show all items in the table."
    }
    
    func scanWithCompletionHandler(completionHandler: (response: AWSDynamoDBPaginatedOutput?, error: NSError?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.defaultDynamoDBObjectMapper()
        let scanExpression = AWSDynamoDBScanExpression()
        scanExpression.limit = 5
        objectMapper.scan(FoodItems.self, expression: scanExpression, completionHandler: {(response: AWSDynamoDBPaginatedOutput?, error: NSError?) -> Void in
            dispatch_async(dispatch_get_main_queue(), {
                completionHandler(response: response, error: error)
            })
        })
    }
    
    func scanWithFilterDescription() -> String {
        return "Find all items with itemDescription < '\("demo-itemDescription-500000")'."
    }
    
    func scanWithFilterWithCompletionHandler(completionHandler: (response: AWSDynamoDBPaginatedOutput?, error: NSError?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.defaultDynamoDBObjectMapper()
        let scanExpression = AWSDynamoDBScanExpression()
        
        scanExpression.filterExpression = "#itemDescription < :itemDescription"
        scanExpression.expressionAttributeNames = ["#itemDescription": "itemDescription" ,]
        scanExpression.expressionAttributeValues = [":itemDescription": "demo-itemDescription-500000" ,]
        objectMapper.scan(FoodItems.self, expression: scanExpression, completionHandler: {(response: AWSDynamoDBPaginatedOutput?, error: NSError?) -> Void in
            dispatch_async(dispatch_get_main_queue(), {
                completionHandler(response: response, error: error)
            })
        })
    }
    
    func insertSampleDataWithCompletionHandler(completionHandler: (errors: [NSError]?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.defaultDynamoDBObjectMapper()
        var errors: [NSError] = []
        let group: dispatch_group_t = dispatch_group_create()
        let numberOfObjects = 20
        
        let itemForGet = FoodItems()
        
        itemForGet._userId = AWSIdentityManager.defaultIdentityManager().identityId!
        itemForGet._itemId = "demo-itemId-500000"
        itemForGet._itemDescription = NoSQLSampleDataGenerator.randomSampleStringWithAttributeName("itemDescription")
        itemForGet._originalPrice = NoSQLSampleDataGenerator.randomSampleNumber()
        itemForGet._title = NoSQLSampleDataGenerator.randomPartitionSampleStringWithAttributeName("title")
        
        
        dispatch_group_enter(group)
        
        objectMapper.save(itemForGet, completionHandler: {(error: NSError?) -> Void in
            if error != nil {
                dispatch_async(dispatch_get_main_queue(), {
                    errors.append(error!)
                })
            }
            dispatch_group_leave(group)
        })
        
        for _ in 1..<numberOfObjects {
            let item: FoodItems = FoodItems()
            item._userId = AWSIdentityManager.defaultIdentityManager().identityId!
            item._itemId = NoSQLSampleDataGenerator.randomSampleStringWithAttributeName("itemId")
            item._itemDescription = NoSQLSampleDataGenerator.randomSampleStringWithAttributeName("itemDescription")
            item._originalPrice = NoSQLSampleDataGenerator.randomSampleNumber()
            item._title = NoSQLSampleDataGenerator.randomPartitionSampleStringWithAttributeName("title")
            
            dispatch_group_enter(group)
            
            objectMapper.save(item, completionHandler: {(error: NSError?) -> Void in
                if error != nil {
                    dispatch_async(dispatch_get_main_queue(), {
                        errors.append(error!)
                    })
                }
                dispatch_group_leave(group)
            })
        }
        
        dispatch_group_notify(group, dispatch_get_main_queue(), {
            if errors.count > 0 {
                completionHandler(errors: errors)
            }
            else {
                completionHandler(errors: nil)
            }
        })
    }
    
    func removeSampleDataWithCompletionHandler(completionHandler: (errors: [NSError]?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.defaultDynamoDBObjectMapper()
        let queryExpression = AWSDynamoDBQueryExpression()
        queryExpression.keyConditionExpression = "#userId = :userId"
        queryExpression.expressionAttributeNames = ["#userId": "userId"]
        queryExpression.expressionAttributeValues = [":userId": AWSIdentityManager.defaultIdentityManager().identityId!,]
        objectMapper.query(FoodItems.self, expression: queryExpression) { (response: AWSDynamoDBPaginatedOutput?, error: NSError?) -> Void in
            if let error = error {
                dispatch_async(dispatch_get_main_queue(), {
                    completionHandler(errors: [error]);
                    })
            } else {
                var errors: [NSError] = []
                let group: dispatch_group_t = dispatch_group_create()
                for item in response!.items {
                    dispatch_group_enter(group)
                    objectMapper.remove(item, completionHandler: {(error: NSError?) -> Void in
                        if error != nil {
                            dispatch_async(dispatch_get_main_queue(), {
                                errors.append(error!)
                            })
                        }
                        dispatch_group_leave(group)
                    })
                }
                dispatch_group_notify(group, dispatch_get_main_queue(), {
                    if errors.count > 0 {
                        completionHandler(errors: errors)
                    }
                    else {
                        completionHandler(errors: nil)
                    }
                })
            }
        }
    }
    
    func updateItem(item: AWSDynamoDBObjectModel, completionHandler: (error: NSError?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.defaultDynamoDBObjectMapper()
        
        let itemToUpdate: FoodItems = item as! FoodItems
        
        itemToUpdate._itemDescription = NoSQLSampleDataGenerator.randomSampleStringWithAttributeName("itemDescription")
        itemToUpdate._originalPrice = NoSQLSampleDataGenerator.randomSampleNumber()
        itemToUpdate._title = NoSQLSampleDataGenerator.randomPartitionSampleStringWithAttributeName("title")
        
        objectMapper.save(itemToUpdate, completionHandler: {(error: NSError?) -> Void in
            dispatch_async(dispatch_get_main_queue(), {
                completionHandler(error: error)
            })
        })
    }
    
    func removeItem(item: AWSDynamoDBObjectModel, completionHandler: (error: NSError?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.defaultDynamoDBObjectMapper()
        
        objectMapper.remove(item, completionHandler: {(error: NSError?) -> Void in
            dispatch_async(dispatch_get_main_queue(), {
                completionHandler(error: error)
            })
        })
    }
}
class FoodItemsPrimaryIndex: NSObject, Index {
    
    var indexName: String? {
        return nil
    }
    
    func supportedOperations() -> [String] {
        return [
            QueryWithPartitionKey,
            QueryWithPartitionKeyAndFilter,
            QueryWithPartitionKeyAndSortKey,
            QueryWithPartitionKeyAndSortKeyAndFilter,
        ]
    }
    
    func queryWithPartitionKeyDescription() -> String {
        return "Find all items with userId = '\(AWSIdentityManager.defaultIdentityManager().identityId!)'."
    }
    
    func queryWithPartitionKeyWithCompletionHandler(completionHandler: (response: AWSDynamoDBPaginatedOutput?, error: NSError?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.defaultDynamoDBObjectMapper()
        let queryExpression = AWSDynamoDBQueryExpression()
        
        queryExpression.keyConditionExpression = "#userId = :userId"
        queryExpression.expressionAttributeNames = ["#userId": "userId",]
        queryExpression.expressionAttributeValues = [":userId": AWSIdentityManager.defaultIdentityManager().identityId!,]
        objectMapper.query(FoodItems.self, expression: queryExpression, completionHandler: {(response: AWSDynamoDBPaginatedOutput?, error: NSError?) -> Void in
            dispatch_async(dispatch_get_main_queue(), {
                completionHandler(response: response, error: error)
            })
        })
    }
    
    func queryWithPartitionKeyAndFilterDescription() -> String {
        return "Find all items with userId = '\(AWSIdentityManager.defaultIdentityManager().identityId!)' and itemDescription > '\("demo-itemDescription-500000")'."
    }
    
    func queryWithPartitionKeyAndFilterWithCompletionHandler(completionHandler: (response: AWSDynamoDBPaginatedOutput?, error: NSError?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.defaultDynamoDBObjectMapper()
        let queryExpression = AWSDynamoDBQueryExpression()
        
        queryExpression.keyConditionExpression = "#userId = :userId"
        queryExpression.filterExpression = "#itemDescription > :itemDescription"
        queryExpression.expressionAttributeNames = [
            "#userId": "userId",
            "#itemDescription": "itemDescription",
        ]
        queryExpression.expressionAttributeValues = [
            ":userId": AWSIdentityManager.defaultIdentityManager().identityId!,
            ":itemDescription": "demo-itemDescription-500000",
        ]
        
        objectMapper.query(FoodItems.self, expression: queryExpression, completionHandler: {(response: AWSDynamoDBPaginatedOutput?, error: NSError?) -> Void in
            dispatch_async(dispatch_get_main_queue(), {
                completionHandler(response: response, error: error)
            })
        })
    }
    
    func queryWithPartitionKeyAndSortKeyDescription() -> String {
        return "Find all items with userId = '\(AWSIdentityManager.defaultIdentityManager().identityId!)' and itemId < '\("demo-itemId-500000")'."
    }
    
    func queryWithPartitionKeyAndSortKeyWithCompletionHandler(completionHandler: (response: AWSDynamoDBPaginatedOutput?, error: NSError?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.defaultDynamoDBObjectMapper()
        let queryExpression = AWSDynamoDBQueryExpression()
        
        queryExpression.keyConditionExpression = "#userId = :userId AND #itemId < :itemId"
        queryExpression.expressionAttributeNames = [
            "#userId": "userId",
            "#itemId": "itemId",
        ]
        queryExpression.expressionAttributeValues = [
            ":userId": AWSIdentityManager.defaultIdentityManager().identityId!,
            ":itemId": "demo-itemId-500000",
        ]
        
        objectMapper.query(FoodItems.self, expression: queryExpression, completionHandler: {(response: AWSDynamoDBPaginatedOutput?, error: NSError?) -> Void in
            dispatch_async(dispatch_get_main_queue(), {
                completionHandler(response: response, error: error)
            })
        })
    }
    
    func queryWithPartitionKeyAndSortKeyAndFilterDescription() -> String {
        return "Find all items with userId = '\(AWSIdentityManager.defaultIdentityManager().identityId!)', itemId < '\("demo-itemId-500000")', and itemDescription > '\("demo-itemDescription-500000")'."
    }
    
    func queryWithPartitionKeyAndSortKeyAndFilterWithCompletionHandler(completionHandler: (response: AWSDynamoDBPaginatedOutput?, error: NSError?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.defaultDynamoDBObjectMapper()
        let queryExpression = AWSDynamoDBQueryExpression()
        
        queryExpression.keyConditionExpression = "#userId = :userId AND #itemId < :itemId"
        queryExpression.filterExpression = "#itemDescription > :itemDescription"
        queryExpression.expressionAttributeNames = [
            "#userId": "userId",
            "#itemId": "itemId",
            "#itemDescription": "itemDescription",
        ]
        queryExpression.expressionAttributeValues = [
            ":userId": AWSIdentityManager.defaultIdentityManager().identityId!,
            ":itemId": "demo-itemId-500000",
            ":itemDescription": "demo-itemDescription-500000",
        ]
        
        objectMapper.query(FoodItems.self, expression: queryExpression, completionHandler: {(response: AWSDynamoDBPaginatedOutput?, error: NSError?) -> Void in
            dispatch_async(dispatch_get_main_queue(), {
                completionHandler(response: response, error: error)
            })
        })
    }
}
class FoodItemsTitle: NSObject, Index {
    
    var indexName: String? {
        return "title"
    }
    
    func supportedOperations() -> [String] {
        return [
            QueryWithPartitionKey,
            QueryWithPartitionKeyAndFilter,
        ]
    }
    
    func queryWithPartitionKeyDescription() -> String {
        return "Find all items with title = '\("demo-title-3")'."
    }
    
    func queryWithPartitionKeyWithCompletionHandler(completionHandler: (response: AWSDynamoDBPaginatedOutput?, error: NSError?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.defaultDynamoDBObjectMapper()
        let queryExpression = AWSDynamoDBQueryExpression()
        
        queryExpression.indexName = "title"
        queryExpression.keyConditionExpression = "#title = :title"
        queryExpression.expressionAttributeNames = ["#title": "title",]
        queryExpression.expressionAttributeValues = [":title": "demo-title-3",]
        objectMapper.query(FoodItems.self, expression: queryExpression, completionHandler: {(response: AWSDynamoDBPaginatedOutput?, error: NSError?) -> Void in
            dispatch_async(dispatch_get_main_queue(), {
                completionHandler(response: response, error: error)
            })
        })
    }
    
    func queryWithPartitionKeyAndFilterDescription() -> String {
        return "Find all items with title = '\("demo-title-3")' and itemId > '\("demo-itemId-500000")'."
    }
    
    func queryWithPartitionKeyAndFilterWithCompletionHandler(completionHandler: (response: AWSDynamoDBPaginatedOutput?, error: NSError?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.defaultDynamoDBObjectMapper()
        let queryExpression = AWSDynamoDBQueryExpression()
        
        queryExpression.indexName = "title"
        queryExpression.keyConditionExpression = "#title = :title"
        queryExpression.filterExpression = "#itemId > :itemId"
        queryExpression.expressionAttributeNames = [
            "#title": "title",
            "#itemId": "itemId",
        ]
        queryExpression.expressionAttributeValues = [
            ":title": "demo-title-3",
            ":itemId": "demo-itemId-500000",
        ]
        
        objectMapper.query(FoodItems.self, expression: queryExpression, completionHandler: {(response: AWSDynamoDBPaginatedOutput?, error: NSError?) -> Void in
            dispatch_async(dispatch_get_main_queue(), {
                completionHandler(response: response, error: error)
            })
        })
    }
    
}
