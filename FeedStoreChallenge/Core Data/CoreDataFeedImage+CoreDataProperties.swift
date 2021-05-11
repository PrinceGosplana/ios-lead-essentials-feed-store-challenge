//
//  CoreDataFeedImage+CoreDataProperties.swift
//  FeedStoreChallenge
//
//  Created by OLEKSANDR ISAIEV on 11.05.2021.
//  Copyright © 2021 Essential Developer. All rights reserved.
//
//

import Foundation
import CoreData

extension CoreDataFeedImage {
	@nonobjc public class func fetchRequest() -> NSFetchRequest<CoreDataFeedImage> {
		return NSFetchRequest<CoreDataFeedImage>(entityName: "CoreDataFeedImage")
	}

	@NSManaged public var id: UUID
	@NSManaged public var imageDescription: String?
	@NSManaged public var url: URL
	@NSManaged public var location: String?
	@NSManaged public var coreDataFeed: CoreDataFeed?
}

extension CoreDataFeedImage: Identifiable {}
