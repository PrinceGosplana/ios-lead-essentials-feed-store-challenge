//
//  CoreDataFeed+CoreDataProperties.swift
//  FeedStoreChallenge
//
//  Created by OLEKSANDR ISAIEV on 11.05.2021.
//  Copyright © 2021 Essential Developer. All rights reserved.
//
//

import Foundation
import CoreData

extension CoreDataFeed {
	@nonobjc public class func fetchRequest() -> NSFetchRequest<CoreDataFeed> {
		return NSFetchRequest<CoreDataFeed>(entityName: "CoreDataFeed")
	}

	@NSManaged public var timestamp: Date?
	@NSManaged public var coreDataFeedImage: CoreDataFeedImage?
}

extension CoreDataFeed: Identifiable {}
