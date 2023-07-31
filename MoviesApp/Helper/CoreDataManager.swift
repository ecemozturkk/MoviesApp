//
//  CoreDataManager.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 31.07.2023.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    init(){}
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Movie")
        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Failed to load persistent stores: \(error)")
            }
        }
        return container
    }()
    
    
    
    func saveToWatchList(date: String, imageUrl: String, name: String, rating: Double, movieId: Int) {
        let managedContext = persistentContainer.viewContext
        
        // Check if a movie with the same movieId already exists in WatchList
        let fetchRequest = NSFetchRequest<WatchList>(entityName: "WatchList")
        fetchRequest.predicate = NSPredicate(format: "movieId == %d", movieId)
        
        do {
            let results = try managedContext.fetch(fetchRequest)
            
            if results.count > 0 {
                showAlertAnyWhere(message: "Already added to watchlist.")
                return
            }
        } catch {
            print("Error fetching data: \(error)")
            return
        }
        
        let watchList = WatchList(context: managedContext)
        
        // Set the properties of the new WatchList item
        watchList.date = date
        watchList.imageUrl = imageUrl
        watchList.name = name
        watchList.rating = rating
        watchList.movieId = Int64(movieId)
        
        do {
            try managedContext.save()
            print("Movie saved to WatchList successfully.")
            showAlertAnyWhere(message: "Movie saved to WatchList successfully.")
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
}


extension CoreDataManager {
    
    // New function to save a booking to CoreData
    func saveBooking(movieId: Int, bannerPath: String, movieName: String, theater: String, date: String, seat: String) {
        let managedContext = persistentContainer.viewContext
        
        let booking = Booking(context: managedContext)
        booking.movieId = Int64(movieId)
        booking.bannerPath = bannerPath
        booking.movieName = movieName
        booking.theater = theater
        booking.date = date
        booking.seat = seat
        
        do {
            try managedContext.save()
            print("Booking saved successfully.")
            //   showAlertAnyWhere(message: "Booking saved successfully.")
        } catch let error as NSError {
            print("Could not save booking. \(error), \(error.userInfo)")
        }
    }
    
    func getBookings() -> [BookingItem] {
        let managedContext = persistentContainer.viewContext
        
        // Fetch all items from the Booking entity
        let fetchRequest = NSFetchRequest<Booking>(entityName: "Booking")
        
        do {
            let bookings = try managedContext.fetch(fetchRequest)
            
            // Convert the Booking managed objects to an array of BookingItem structs
            let bookingArray: [BookingItem] = bookings.map { booking in
                return BookingItem(movieId: Int(booking.movieId),
                                   bannerPath: booking.bannerPath ?? "",
                                   movieName: booking.movieName ?? "",
                                   theater: booking.theater ?? "",
                                   date: booking.date ?? "",
                                   seat: booking.seat ?? "")
            }
            
            return bookingArray
            
        } catch {
            print("Error fetching data: \(error)")
            return []
        }
    }
    
    
}

extension CoreDataManager  {
    
    func getWatchlist() -> [WatchListItem] {
        let managedContext = persistentContainer.viewContext
        
        // Fetch all items from the WatchList entity
        let fetchRequest = NSFetchRequest<WatchList>(entityName: "WatchList")
        
        do {
            let watchlistItems = try managedContext.fetch(fetchRequest)
            
            // Convert the WatchList managed objects to an array of WatchListItem structs
            let watchlistArray: [WatchListItem] = watchlistItems.map { watchlistItem in
                return WatchListItem(date: watchlistItem.date ?? "",
                                     imageUrl: watchlistItem.imageUrl ?? "",
                                     name: watchlistItem.name ?? "",
                                     rating: watchlistItem.rating,
                                     movieId: Int(watchlistItem.movieId))
            }
            
            return watchlistArray
            
        } catch {
            print("Error fetching data: \(error)")
            return []
        }
    }
    
    
}



struct WatchListItem {
    var date: String
    var imageUrl: String
    var name: String
    var rating: Double
    var movieId: Int
}

struct BookingItem {
    var movieId: Int
    var bannerPath: String
    var movieName: String
    var theater: String
    var date: String
    var seat: String
}
