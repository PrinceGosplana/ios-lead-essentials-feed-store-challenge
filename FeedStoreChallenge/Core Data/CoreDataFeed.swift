//
//  CoreDataFeed.swift
//  FeedStoreChallenge
//
//  Created by OLEKSANDR ISAIEV on 13.05.2021.
//  Copyright © 2021 Essential Developer. All rights reserved.
//

import Foundation
import CoreData

@objc(CoreDataFeed)
final class CoreDataFeed: NSManagedObject {
	@NSManaged var timestamp: Date
	@NSManaged var images: NSOrderedSet
}

extension CoreDataFeed {
	var localFeed: [LocalFeedImage] {
		return images
			.compactMap { $0 as? CoreDataFeedImage }
			.map { $0.local }
	}

	static func managedFeedSet(from localFeed: [LocalFeedImage], in context: NSManagedObjectContext) -> NSOrderedSet {
		return NSOrderedSet(array: localFeed.map { feed in
			let managed = CoreDataFeedImage(context: context)
			managed.id = feed.id
			managed.imageDescription = feed.description
			managed.location = feed.location
			managed.url = feed.url
			return managed
		})
	}
}

extension CoreDataFeed {
	static func fetch(in context: NSManagedObjectContext) throws -> CoreDataFeed? {
		let request = NSFetchRequest<CoreDataFeed>(entityName: entity().name!)
		request.returnsObjectsAsFaults = false
		return try context.fetch(request).first
	}

	static func uniqueInstance(in context: NSManagedObjectContext) throws -> CoreDataFeed {
		try fetch(in: context).map(context.delete)
		return CoreDataFeed(context: context)
	}
}
