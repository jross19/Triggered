//
//  TwitterProfiles.swift
//  Triggered
//
//  Created by Nicholas Stearns on 12/13/18.
//  Copyright © 2018 Jonathan Ross. All rights reserved.
//

import Foundation

// The struct used to initialize the basis of information needed for web parsing
struct profile {
    var profileName: String
    var party: String
    var profileImage: String
}
// The stored list of Republican Twitter profiles
func getRepublicanProfiles() -> [profile] {
    var accounts: [profile] = []
    let trump: profile = profile(profileName: "realDonaldTrump", party: "Republican", profileImage: "Trump.jpg")
    let romney: profile = profile(profileName: "SenatorRomney", party: "Republican", profileImage: "Romney.jpg")
    let bShapiro = profile(profileName: "BenShapiro", party: "Republican", profileImage: "shapiro.jpg")
    let west = profile(profileName: "kanyewest", party: "Republican", profileImage: "west.jpg")
    let sCrowder = profile(profileName: "scrowder", party: "Republican", profileImage: "crowder.jpg")
    let foxNews = profile(profileName: "FoxNews", party: "Republican", profileImage: "FoxNews.jpg")
    let mPence = profile(profileName: "mike_pence", party: "Republican", profileImage: "pence.jpg")
    let kConway = profile(profileName: "KellyannePolls", party: "Republican", profileImage: "conway.jpg")
    let tCarlson = profile(profileName: "tuckercarlson", party: "Republican", profileImage: "Carlson.jpg")
    let reilly = profile(profileName: "BillOReilly", party: "Republican", profileImage: "oreilly.jpg")
    accounts.append(trump)
    accounts.append(romney)
    accounts.append(west)
    accounts.append(bShapiro)
    accounts.append(sCrowder)
    accounts.append(foxNews)
    accounts.append(mPence)
    accounts.append(kConway)
    accounts.append(tCarlson)
    accounts.append(reilly)
    return accounts
}

// The stored list of Democrat Twitter profiles
func getDemocratProfiles() -> [profile] {
    var accounts: [profile] = []
    let hClinton = profile(profileName: "HillaryClinton", party: "Democrat", profileImage: "clinton.jpg")
    let bClinton = profile(profileName: "BillClinton", party: "Democrat", profileImage: "bClinton.jpg")
    let CNN = profile(profileName: "CNN", party: "Democrat", profileImage: "CNN.jpg")
    let obama = profile(profileName: "BarackObama", party: "Democrat", profileImage: "obama.jpg")
    let eWarren = profile(profileName: "SenWarren", party: "Democrat", profileImage: "warren.jpg")
    let nyTimes = profile(profileName: "nytimes", party: "Democrat", profileImage: "nyTimes.jpg")
    let bSanders = profile(profileName: "SenSanders", party: "Democrat", profileImage: "bSanders.jpg")
    let nPelosi = profile(profileName: "SpeakerPelosi", party: "Democrat", profileImage: "nPelosi.jpg")
    let cSchumer = profile(profileName: "SenSchumer", party: "Democrat", profileImage: "cSchumer.jpg")
    let kHarris = profile(profileName: "KamalaHarris", party: "Democrat", profileImage: "kHarris.jpg")
    accounts.append(hClinton)
    accounts.append(nyTimes)
    accounts.append(bClinton)
    accounts.append(obama)
    accounts.append(eWarren)
    accounts.append(CNN)
    accounts.append(bSanders)
    accounts.append(nPelosi)
    accounts.append(cSchumer)
    accounts.append(kHarris)
    return accounts
}
