//
//  Copyright © 2021 Essential Developer. All rights reserved.
//

import CoreData

public final class CoreDataFeedStore: FeedStore {
	private static let modelName = "FeedStore"
	private static let model = NSManagedObjectModel(name: modelName, in: Bundle(for: CoreDataFeedStore.self))

	private let container: NSPersistentContainer
	private let context: NSManagedObjectContext

	struct ModelNotFound: Error {
		let modelName: String
	}

	public init(storeURL: URL) throws {
		guard let model = CoreDataFeedStore.model else {
			throw ModelNotFound(modelName: CoreDataFeedStore.modelName)
		}

		container = try NSPersistentContainer.load(
			name: CoreDataFeedStore.modelName,
			model: model,
			url: storeURL
		)
		context = container.newBackgroundContext()
	}

	public func retrieve(completion: @escaping RetrievalCompletion) {
		let context = self.context
		context.perform {
			do {
				let fetchedFeedRequest: NSFetchRequest<CoreDataFeed> = CoreDataFeed.fetchRequest()
				let result = try context.fetch(fetchedFeedRequest)

				guard let coreDataFeed = result.first,
				      let coreDataFeedArray = (coreDataFeed.coreDataFeedImages?.array as? [CoreDataFeedImage]) else {
					completion(.empty)
					return
				}

				completion(.found(feed: coreDataFeedArray.toLocal(), timestamp: coreDataFeed.timestamp))
			} catch {
				completion(.failure(error))
			}
		}
	}

	public func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {
		let context = self.context
		context.perform {}
	}

	public func deleteCachedFeed(completion: @escaping DeletionCompletion) {
		fatalError("Must be implemented")
	}

	private func deleteCacheIfExists(on context: NSManagedObjectContext) throws {
		let fetchedFeedRequest: NSFetchRequest<CoreDataFeed> = CoreDataFeed.fetchRequest()
		let result = try context.fetch(fetchedFeedRequest)
		result.forEach {
			context.delete($0)
		}
	}
}

private extension Array where Element == CoreDataFeedImage {
	func toLocal() -> [LocalFeedImage] {
		return map {
			return LocalFeedImage(id: $0.id, description: $0.imageDescription, location: $0.location, url: $0.url)
		}
	}
}
