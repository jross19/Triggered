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
    let west = profile(profileName: "kanyewest", party: "Republican", profileImage: "west.jpg")
    accounts.append(trump)
    accounts.append(romney)
    accounts.append(west)
    
    return accounts
}

func getDemocratProfiles() -> [profile] {
    var accounts: [profile] = []
    let hClinton: profile = profile(profileName: "HillaryClinton", party: "Democrat", profileImage: "clinton.jpg")
    let bClinton: profile = profile(profileName: "BillClinton", party: "Democrat", profileImage: "bClinton.jpg")
    let bShapiro = profile(profileName: "BenShapiro", party: "Democrat", profileImage: "shapiro.jpg")
    let obama = profile(profileName: "BarackObama", party: "Democrat", profileImage: "obama.jpg")
    let eWarren = profile(profileName: "SenWarren", party: "Democrat", profileImage: "warren.jpg")
    accounts.append(hClinton)
    accounts.append(bClinton)
    accounts.append(bShapiro)
    accounts.append(obama)
    accounts.append(eWarren)
    return accounts
}
