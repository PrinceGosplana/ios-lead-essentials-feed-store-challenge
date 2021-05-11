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

	@NSManaged public var timestamp: Date
	@NSManaged public var coreDataFeedImages: NSOrderedSet?
}

// MARK: Generated accessors for coreDataFeedImages
extension CoreDataFeed {
	@objc(insertObject:inCoreDataFeedImagesAtIndex:)
	@NSManaged internal func insertIntoCoreDataFeedImages(_ value: CoreDataFeedImage, at idx: Int)

	@objc(removeObjectFromCoreDataFeedImagesAtIndex:)
	@NSManaged internal func removeFromCoreDataFeedImages(at idx: Int)

	@objc(insertCoreDataFeedImages:atIndexes:)
	@NSManaged internal func insertIntoCoreDataFeedImages(_ values: [CoreDataFeedImage], at indexes: NSIndexSet)

	@objc(removeCoreDataFeedImagesAtIndexes:)
	@NSManaged internal func removeFromCoreDataFeedImages(at indexes: NSIndexSet)

	@objc(replaceObjectInCoreDataFeedImagesAtIndex:withObject:)
	@NSManaged internal func replaceCoreDataFeedImages(at idx: Int, with value: CoreDataFeedImage)

	@objc(replaceCoreDataFeedImagesAtIndexes:withCoreDataFeedImages:)
	@NSManaged internal func replaceCoreDataFeedImages(at indexes: NSIndexSet, with values: [CoreDataFeedImage])

	@objc(addCoreDataFeedImagesObject:)
	@NSManaged internal func addToCoreDataFeedImages(_ value: CoreDataFeedImage)

	@objc(removeCoreDataFeedImagesObject:)
	@NSManaged internal func removeFromCoreDataFeedImages(_ value: CoreDataFeedImage)

	@objc(addCoreDataFeedImages:)
	@NSManaged internal func addToCoreDataFeedImages(_ values: NSOrderedSet)

	@objc(removeCoreDataFeedImages:)
	@NSManaged internal func removeFromCoreDataFeedImages(_ values: NSOrderedSet)
}

extension CoreDataFeed: Identifiable {}
