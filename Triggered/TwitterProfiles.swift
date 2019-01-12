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
    accounts.append(trump)
    accounts.append(romney)
    
    return accounts
}

func getDemocratProfiles() -> [profile] {
    var accounts: [profile] = []
    let clinton: profile = profile(profileName: "HillaryClinton", party: "Democrat", profileImage: "clinton.jpg")
    accounts.append(clinton)
    return accounts
}
