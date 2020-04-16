//  Copyright © 2020 Kayvon. All rights reserved.

import Foundation
import CoreData

class DataManager : NSObject {
    static let shared = DataManager()

    private lazy var persistentContainer:NSPersistentContainer = {
        let momdName = "NBAQuiz"

        guard let modelURL = Bundle(for: type(of: self)).url(forResource: momdName, withExtension:"momd") else {
            fatalError("Error loading model from bundle")
        }

        guard let mom = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Error initializing mom from: \(modelURL)")
        }

        let container = NSPersistentContainer(name: momdName, managedObjectModel: mom)

        container.loadPersistentStores(completionHandler: { (storeDescriptioon, error) in
            // Set merge policy to allow coredata to try to intelligently overwrite dupes using properties from the new version.
            container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy

            if let error = error as NSError? {
                print("ERROR: error loading Debug Kit Data Manager persistent stores - \(error), \(error.userInfo)")
            }
        })

        return container
    }()

    func saveUser(_ user:User) {
        let context = persistentContainer.viewContext
        let userData = UserData(entity: UserData.entity(), insertInto:context)

        userData.userId = userModel.userId

        // Delete previous decisions (ideally we would only delete the dijoint but this is efficient enough)
        DecisionData.batchDeleteDecisionsMatchingUserId(userModel.userId, context: context)

        for decision in userModel.decisionModels {
            // Delete previous reasons (ideally we would only delete the dijoint but this is efficient enough)
            ReasonData.batchDeleteReasonsMatchingDecisionId(decision.decisionId, context: context)

            for reason in decision.reasonModels {
                // Might need to dedupe here
                if reason.isValid() {
                    reason.save(context)
                }
            }

            if decision.isValid() {
                decision.save(context)
            }
        }

        context.safeSave()
    }

    func fetchUserDataMatchingUserId(_ userId:UUID) -> UserData? {
        let context = persistentContainer.viewContext

        let fetchRequest:NSFetchRequest = UserData.fetchRequest()

        var userData:UserData?

        fetchRequest.predicate = NSPredicate(format: "userId == %@", userId.uuidString)

        do {
            userData = try context.fetch(fetchRequest).first
        } catch {
            if let error = error as NSError? {
                print("ERROR: error fetching user - \(error), \(error.userInfo)")
            }
        }

        return userData
    }

    func fetchDecisionModelForDecisionId(_ decisionId:UUID) -> DecisionModel? {
        let context = persistentContainer.viewContext

        let fetchRequest:NSFetchRequest<DecisionData> = DecisionData.fetchRequest(decisionId:decisionId)

        var decisionDatas:[DecisionData]?

        do {
            decisionDatas = try context.fetch(fetchRequest)
        } catch {
            if let error = error as NSError? {
                print("ERROR: error fetching user - \(error), \(error.userInfo)")
            }
        }

        if let data = decisionDatas?.first {
            return DecisionModel(decisionData: data)
        }

        return nil
    }

    func fetchDecisionDataMatchingUserId(_ userId:UUID) -> [DecisionData]? {
        let context = persistentContainer.viewContext

        let fetchRequest:NSFetchRequest<DecisionData> = DecisionData.fetchRequest(userId:userId)

        var decisionDatas:[DecisionData]?

        do {
            decisionDatas = try context.fetch(fetchRequest)
        } catch {
            if let error = error as NSError? {
                print("ERROR: error fetching user - \(error), \(error.userInfo)")
            }
        }

        return decisionDatas
    }

    func fetchReasonDataMatchingDecisionId(_ decisionId:UUID) -> [ReasonData]? {
        let context = persistentContainer.viewContext

        let fetchRequest:NSFetchRequest<ReasonData> = ReasonData.fetchRequest(decisionId:decisionId)

        var reasonData:[ReasonData]?

        fetchRequest.predicate = NSPredicate(format: "decisionId == %@", decisionId.uuidString)

        do {
            reasonData = try context.fetch(fetchRequest)
        } catch {
            if let error = error as NSError? {
                print("ERROR: error fetching user - \(error), \(error.userInfo)")
            }
        }

        return reasonData
    }
}

extension NSManagedObjectContext {
    func safeSave() {
        guard self.hasChanges else {
            return
        }

        do {
            try self.save()
        } catch {
            if let error = error as NSError? {
                print("ERROR: error saving context - \(error), \(error.userInfo)")
            }
        }
    }
}
