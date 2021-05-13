//
//  CoreDataFeedImage.swift
//  FeedStoreChallenge
//
//  Created by OLEKSANDR ISAIEV on 13.05.2021.
//  Copyright © 2021 Essential Developer. All rights reserved.
//

import Foundation
import CoreData

@objc(CoreDataFeedImage)
final class CoreDataFeedImage: NSManagedObject {
	@NSManaged var id: UUID
	@NSManaged var imageDescription: String?
	@NSManaged var location: String?
	@NSManaged var url: URL
	@NSManaged var coreDataFeed: CoreDataFeed
}

extension CoreDataFeedImage {
	var local: LocalFeedImage {
		LocalFeedImage(id: id, description: imageDescription, location: location, url: url)
	}
}
