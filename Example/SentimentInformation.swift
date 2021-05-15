//
//  SentimentInformation.swift
//  Styvio
//
//  Created by Jared Cassoutt on 5/15/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation

struct SentimentInformation: Decodable {
    
    public let ticker: String?
    public let stockTwitsPositiveSentiment: Double?
    public let stockTwitsNegativeSentiment: Double?
    public let stockTwitsNeutralSentiment: Double?
    public let redditWallStreetBetsOccurences: Int?
    public let redditWallStreetBetsPositiveSentiment: Double?
    public let redditWallStreetBetsNegativeSentiment: Double?
    public let redditWallStreetBetsNeutralSentiment: Double?
    public let redditStocksOccurences: Int?
    public let redditStocksPositiveSentiment: Double?
    public let redditStocksNegativeSentiment: Double?
    public let redditStocksNeutralSentiment: Double?
    public let redditStockMarketOccurences: Int?
    public let redditStockMarketPositiveSentiment: Double?
    public let redditStockMarketNegativeSentiment: Double?
    public let redditStockMarketNeutralSentiment: Double?
    public let redditInvestingOccurences: Int?
    public let redditInvestingPositiveSentiment: Double?
    public let redditInvestingNegativeSentiment: Double?
    public let redditInvestingNeutralSentiment: Double?
    public let totalBullishAverage: Double?
    public let totalBearishAverage: Double?
    public let totalInstances: Int?
    
    private enum CodingKeys: String, CodingKey {
        case ticker =  "ticker"
        case stockTwitsPositiveSentiment =  "stockTwitsPositiveSentiment"
        case stockTwitsNegativeSentiment =  "stockTwitsNegativeSentiment"
        case stockTwitsNeutralSentiment =  "stockTwitsNeutralSentiment"
        case redditWallStreetBetsOccurences =  "redditWallStreetBetsOccurences"
        case redditWallStreetBetsPositiveSentiment =  "redditWallStreetBetsPositiveSentiment"
        case redditWallStreetBetsNegativeSentiment =  "redditWallStreetBetsNegativeSentiment"
        case redditWallStreetBetsNeutralSentiment =  "redditWallStreetBetsNeutralSentiment"
        case redditStocksOccurences =  "redditStocksOccurences"
        case redditStocksPositiveSentiment =  "redditStocksPositiveSentiment"
        case redditStocksNegativeSentiment =  "redditStocksNegativeSentiment"
        case redditStocksNeutralSentiment =  "redditStocksNeutralSentiment"
        case redditStockMarketOccurences =  "redditStockMarketOccurences"
        case redditStockMarketPositiveSentiment =  "redditStockMarketPositiveSentiment"
        case redditStockMarketNegativeSentiment =  "redditStockMarketNegativeSentiment"
        case redditStockMarketNeutralSentiment =  "redditStockMarketNeutralSentiment"
        case redditInvestingOccurences =  "redditInvestingOccurences"
        case redditInvestingPositiveSentiment =  "redditInvestingPositiveSentiment"
        case redditInvestingNegativeSentiment =  "redditInvestingNegativeSentiment"
        case redditInvestingNeutralSentiment =  "redditInvestingNeutralSentiment"
        case totalBullishAverage =  "totalBullishAverage"
        case totalBearishAverage =  "totalBearishAverage"
        case totalInstances = "totalInstances"
    }
}
