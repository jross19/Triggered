//
//  TwitterProfiles.swift
//  Triggered
//
//  Created by Nicholas Stearns on 12/13/18.
//  Copyright © 2018 Jonathan Ross. All rights reserved.
//

import Foundation

struct profile {
    var profileName: String
    var party: String
    var profileImage: String
}

func getRepublicanProfiles() -> [profile] {
    var accounts: [profile] = []
    let trump: profile = profile(profileName: "realDonaldTrump", party: "Republican", profileImage: "Trump.jpg")
    let romney: profile = profile(profileName: "SenatorRomney", party: "Republican", profileImage: "Romney.jpg")
    let bShapiro = profile(profileName: "BenShapiro", party: "Republican", profileImage: "shapiro.jpg")
    let west = profile(profileName: "kanyewest", party: "Republican", profileImage: "west.jpg")
    let sCrowder = profile(profileName: "scrowder", party: "Republican", profileImage: "crowder.jpg")
    let foxNews = profile(profileName: "FoxNews", party: "Republican", profileImage: "FoxNews.jpg")
    accounts.append(trump)
    accounts.append(romney)
    accounts.append(west)
    accounts.append(bShapiro)
    accounts.append(sCrowder)
    accounts.append(foxNews)
    return accounts
}

func getDemocratProfiles() -> [profile] {
    var accounts: [profile] = []
    let hClinton = profile(profileName: "HillaryClinton", party: "Democrat", profileImage: "clinton.jpg")
    let bClinton = profile(profileName: "BillClinton", party: "Democrat", profileImage: "bClinton.jpg")
    let CNN = profile(profileName: "CNN", party: "Democrat", profileImage: "CNN.jpg")
    let obama = profile(profileName: "BarackObama", party: "Democrat", profileImage: "obama.jpg")
    let eWarren = profile(profileName: "SenWarren", party: "Democrat", profileImage: "warren.jpg")
    let nyTimes = profile(profileName: "nytimes", party: "Democrat", profileImage: "nyTimes.jpg")
    let bSanders = profile(profileName: "SenSanders", party: "Democrat", profileImage: "bSanders.jpg")
    accounts.append(hClinton)
    accounts.append(nyTimes)
    accounts.append(bClinton)
    accounts.append(obama)
    accounts.append(eWarren)
    accounts.append(CNN)
    accounts.append(bSanders)
    return accounts
}
