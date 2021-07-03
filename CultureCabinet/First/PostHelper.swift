//
//  PostHelper.swift
//  CultureCabinet
//
//  Created by 임수정 on 2021/07/02.
//

import Foundation
import CoreData
import UIKit

let appDelegate = UIApplication.shared.delegate as! AppDelegate
let context = appDelegate.persistentContainer.viewContext

class PostHelper {
    let entity = NSEntityDescription.entity(forEntityName: "Post", in: context)

    func fetchAllPost()->[Post]{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Post")
        var posts = [Post]()
        do {
            posts = try context.fetch(fetchRequest) as! [Post]
        } catch {
            print(error.localizedDescription)
        }
        return posts
    }
    
    func fetchACategoryPost(category:CategoryName)->[Post]{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Post")
//        fetchRequest.predicate = NSPredicate(format: "category = %@", CategoryNameToInt[category]!)
        fetchRequest.predicate = NSPredicate(format: "category = 0")
        var posts = [Post]()
        do {
            posts = try context.fetch(fetchRequest) as! [Post]
        } catch {
            print(error.localizedDescription)
        }
        return posts
    }
    
    func fetchMoviePost()->[Post]{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Post")
        fetchRequest.predicate = NSPredicate(format: "category = 0")
        var posts = [Post]()
        do {
            posts = try context.fetch(fetchRequest) as! [Post]
        } catch {
            print(error.localizedDescription)
        }
        return posts
    }
    
    func fetchDramaPost()->[Post]{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Post")
        fetchRequest.predicate = NSPredicate(format: "category = 1")
        var posts = [Post]()
        do {
            posts = try context.fetch(fetchRequest) as! [Post]
        } catch {
            print(error.localizedDescription)
        }
        return posts
    }
    
    func fetchPlayPost()->[Post]{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Post")
        fetchRequest.predicate = NSPredicate(format: "category = 2")
        var posts = [Post]()
        do {
            posts = try context.fetch(fetchRequest) as! [Post]
        } catch {
            print(error.localizedDescription)
        }
        return posts
    }
    
    func fetchSportsPost()->[Post]{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Post")
        fetchRequest.predicate = NSPredicate(format: "category = 3")
        var posts = [Post]()
        do {
            posts = try context.fetch(fetchRequest) as! [Post]
        } catch {
            print(error.localizedDescription)
        }
        return posts
    }
    
    func fetchExhibitionPost()->[Post]{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Post")
        fetchRequest.predicate = NSPredicate(format: "category = 4")
        var posts = [Post]()
        do {
            posts = try context.fetch(fetchRequest) as! [Post]
        } catch {
            print(error.localizedDescription)
        }
        return posts
    }
    
    func insertPost(ipost: PostData){
        let dateformatter1 = DateFormatter()
        dateformatter1.locale = Locale(identifier: "ko_KR")
        dateformatter1.timeZone = TimeZone(identifier: "KST")
        dateformatter1.dateFormat = "YYYY-MM-dd"
        
        if let entity = self.entity {
            let post = NSManagedObject(entity: entity, insertInto: context)
            post.setValue(ipost.title, forKey: "title")
            post.setValue(ipost.content, forKey: "content")
//            post.setValue(dateformatter1.string(from: ipost.date), forKey: "date")
            post.setValue("2021-07-01", forKey: "date")
            post.setValue(ipost.image, forKey: "image")
            post.setValue(CategoryNameToInt[ipost.category], forKey: "category")
            post.setValue(ipost.link, forKey: "link")
            post.setValue(ipost.score, forKey: "score")
            do {
                try context.save()
                print("suc")
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func deleteAll(){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Post")
        let delete = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try context.execute(delete)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    
    
}