//
//  StyvioAPI.swift
//  Styvio
//
//  Created by Jared Cassoutt on 5/15/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//
import Foundation

public final class StyvioAPI {
    
    func fetchStockInformation(stockName: String, success: @escaping(_ data:StockInformation)->(),failure:@escaping (_ error:Error)->()) {
        let urlString = "https://www.styvio.com/api/\(stockName)"
        print(urlString)
        //create a url
        if let url = URL(string: urlString) {
            //create URLSession
            let session = URLSession(configuration: .default)
            //give session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error ?? "error")
                    return
                }
                if let safeData = data {
                    
                    let jsonString = String(data: safeData, encoding: String.Encoding.utf8)
                    let parsed = jsonString!.replacingOccurrences(of: ", NaN", with: "")
                    let jsonData = Data(parsed.utf8)
                    
                    //print(String(data: jsonData, encoding: String.Encoding.utf8))
                    
                    let decoder = JSONDecoder()
                    do {
                        let decodedData = try decoder.decode(StockInformation.self, from: jsonData)
                        print(decodedData)
                        success(decodedData)
                    }
                    catch {
                        print(error)
                        failure(error)
                    }
                }
            }
            //Start task
            task.resume()
        }
    }
    
    func fetchSentimentInformation(stockName: String, success: @escaping(_ data:SentimentInformation)->(),failure:@escaping (_ error:Error)->()) {
        let urlString = "https://www.styvio.com/api/sentiment/\(stockName)"
        print(urlString)
        //create a url
        if let url = URL(string: urlString) {
            //create URLSession
            let session = URLSession(configuration: .default)
            //give session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error ?? "error")
                    return
                }
                if let safeData = data {
                    
                    let jsonString = String(data: safeData, encoding: String.Encoding.utf8)
                    let parsed = jsonString!.replacingOccurrences(of: ", NaN", with: "")
                    let jsonData = Data(parsed.utf8)
                    
                    //print(String(data: jsonData, encoding: String.Encoding.utf8))
                    
                    let decoder = JSONDecoder()
                    do {
                        let decodedData = try decoder.decode(SentimentInformation.self, from: jsonData)
                        print(decodedData)
                        success(decodedData)
                    }
                    catch {
                        print(error)
                        failure(error)
                    }
                }
            }
            //Start task
            task.resume()
        }
    }
    
}

//
//  StockInformation.swift
//  Styvio
//
//  Created by Jared Cassoutt on 5/15/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
struct StockInformation: Decodable {
    
    public let ticker: String?
    public let currentPrice: String?
    public let companyData: CompanyData
    public let revenueGrowth: [Int]?
    public let profitGrowth: [Int]?
    public let dailyReturn: String?
    public let yearlyReturn: String?
    public let dailyStockValues: [Double]?
    public let weeklyStockValuesIntraday: [Double]?
    public let weeklyStockValuesDaily: [Double]?
    public let weeklyStockValuesHalfHours: [Double]?
    public let monthlyStockValues: [Double]?
    public let threeMonthlyStockValues: [Double]?
    public let sixMonthlyStockValues: [Double]?
    public let yearlyStockValues: [Double]?
    public let fiveYearlyStockValues: [Double]?
    public let generalPublicHolding: Double?
    public let invScore: String?
    public let invWords: String?
    public let invRate: Double?
    public let tradeScore: String?
    public let tradeWords: String?
    public let tradeRate: Double?
    
    private enum CodingKeys: String, CodingKey {
        case ticker = "ticker"
        case currentPrice = "currentPrice"
        case companyData = "companyData"
        case revenueGrowth =  "revenueGrowth"
        case profitGrowth =  "profitGrowth"
        case dailyReturn =  "dailyReturn"
        case yearlyReturn =  "yearlyReturn"
        case dailyStockValues =  "dailyStockValues"
        case weeklyStockValuesIntraday =  "weeklyStockValuesIntraday"
        case weeklyStockValuesDaily =  "weeklyStockValuesDaily"
        case weeklyStockValuesHalfHours =  "weeklyStockValuesHalfHours"
        case monthlyStockValues =  "monthlyStockValues"
        case threeMonthlyStockValues =  "3monthlyStockValues"
        case sixMonthlyStockValues =  "6monthlyStockValues"
        case yearlyStockValues =  "yearlyStockValues"
        case fiveYearlyStockValues =  "5yearlyStockValues"
        case generalPublicHolding = "generalPublicHolding"
        case invScore = "invScore"
        case invWords = "invWords"
        case invRate = "invRate"
        case tradeScore = "tradeScore"
        case tradeWords = "tradeWords"
        case tradeRate = "tradeRate"
    }
}

struct CompanyData: Decodable {
    
    public let zip: String?
    public let sector: String?
    public let fullTimeEmployees: Int?
    public let longBusinessSummary: String?
    public let city: String?
    public let phone: String?
    public let state: String?
    public let country: String?
    public let companyOfficers: [Double]?
    public let website: String?
    public let maxAge: Int?
    public let address1: String?
    public let industry: String?
    public let previousClose: Double?
    public let regularMarketOpen: Double?
    public let twoHundredDayAverage: Double?
    public let payoutRatio: Double?
    public let regularMarketDayHigh: Double?
    public let averageDailyVolume10Day: Int?
    public let regularMarketPreviousClose: Double?
    public let fiftyDayAverage: Double?
    public let open: Double?
    public let averageVolume10days: Int?
    public let beta: Double?
    public let regularMarketDayLow: Double?
    public let priceHint: Int?
    public let currency: String?
    public let trailingPE: Double?
    public let regularMarketVolume: Int?
    public let marketCap: Int?
    public let averageVolume: Int?
    public let priceToSalesTrailing12Months: Double?
    public let dayLow: Double?
    public let ask: Double?
    public let askSize: Int?
    public let volume: Int?
    public let fiftyTwoWeekHigh: Double?
    public let forwardPE: Double?
    public let fiftyTwoWeekLow: Double?
    public let bid: Double?
    public let tradeable: Bool?
    public let bidSize: Int?
    public let dayHigh: Double?
    public let exchange: String?
    public let shortName: String?
    public let longName: String?
    public let exchangeTimezoneName: String?
    public let exchangeTimezoneShortName: String?
    public let isEsgPopulated: Bool?
    public let gmtOffSetMilliseconds: String?
    public let quoteType: String?
    public let symbol: String?
    public let messageBoardId: String?
    public let market: String?
    public let enterpriseToRevenue: Double?
    public let profitMargins: Double?
    public let enterpriseToEbitda: Double?
    public let fiftyTwoWeekChange: Double?
    public let forwardEps: Double?
    public let sharesOutstanding: Int?
    public let bookValue: Double?
    public let sharesShort: Int?
    public let sharesPercentSharesOut: Double?
    public let lastFiscalYearEnd: Int?
    public let heldPercentInstitutions: Double
    public let netIncomeToCommon: Int?
    public let trailingEps: Double?
    public let SandP52WeekChange: Double?
    public let priceToBook: Double?
    public let heldPercentInsiders: Double
    public let nextFiscalYearEnd: Int?
    public let mostRecentQuarter: Int?
    public let shortRatio: Double?
    public let sharesShortPreviousMonthDate: Int?
    public let floatShares: Int?
    public let enterpriseValue: Int?
    public let lastSplitDate: Int?
    public let lastSplitFactor: String?
    public let earningsQuarterlyGrowth: Double?
    public let dateShortInterest: Int?
    public let pegRatio: Double?
    public let shortPercentOfFloat: Double?
    public let sharesShortPriorMonth: Int?
    public let regularMarketPrice: Double?
    public let logo_url: String?
    public let generalPublicHolding: Double?
    
    private enum CodingKeys: String, CodingKey {
        case zip =  "zip"
        case sector =  "sector"
        case fullTimeEmployees =  "fullTimeEmployees"
        case longBusinessSummary =  "longBusinessSummary"
        case city =  "city"
        case phone =  "phone"
        case state =  "state"
        case country =  "country"
        case companyOfficers =  "companyOfficers"
        case website =  "website"
        case maxAge =  "maxAge"
        case address1 =  "address1"
        case industry =  "industry"
        case previousClose =  "previousClose"
        case regularMarketOpen =  "regularMarketOpen"
        case twoHundredDayAverage =  "twoHundredDayAverage"
        case payoutRatio =  "payoutRatio"
        case regularMarketDayHigh =  "regularMarketDayHigh"
        case averageDailyVolume10Day =  "averageDailyVolume10Day"
        case regularMarketPreviousClose =  "regularMarketPreviousClose"
        case fiftyDayAverage =  "fiftyDayAverage"
        case open =  "open"
        case averageVolume10days =  "averageVolume10days"
        case beta =  "beta"
        case regularMarketDayLow =  "regularMarketDayLow"
        case priceHint =  "priceHint"
        case currency =  "currency"
        case trailingPE =  "trailingPE"
        case regularMarketVolume =  "regularMarketVolume"
        case marketCap =  "marketCap"
        case averageVolume =  "averageVolume"
        case priceToSalesTrailing12Months =  "priceToSalesTrailing12Months"
        case dayLow =  "dayLow"
        case ask =  "ask"
        case askSize =  "askSize"
        case volume =  "volume"
        case fiftyTwoWeekHigh =  "fiftyTwoWeekHigh"
        case forwardPE =  "forwardPE"
        case fiftyTwoWeekLow =  "fiftyTwoWeekLow"
        case bid =  "bid"
        case tradeable =  "tradeable"
        case bidSize =  "bidSize"
        case dayHigh =  "dayHigh"
        case exchange =  "exchange"
        case shortName =  "shortName"
        case longName =  "longName"
        case exchangeTimezoneName =  "exchangeTimezoneName"
        case exchangeTimezoneShortName =  "exchangeTimezoneShortName"
        case isEsgPopulated =  "isEsgPopulated"
        case gmtOffSetMilliseconds =  "gmtOffSetMilliseconds"
        case quoteType =  "quoteType"
        case symbol =  "symbol"
        case messageBoardId =  "messageBoardId"
        case market =  "market"
        case enterpriseToRevenue =  "enterpriseToRevenue"
        case profitMargins =  "profitMargins"
        case enterpriseToEbitda =  "enterpriseToEbitda"
        case fiftyTwoWeekChange =  "52WeekChange"
        case forwardEps =  "forwardEps"
        case sharesOutstanding =  "sharesOutstanding"
        case bookValue =  "bookValue"
        case sharesShort =  "sharesShort"
        case sharesPercentSharesOut =  "sharesPercentSharesOut"
        case lastFiscalYearEnd =  "lastFiscalYearEnd"
        case heldPercentInstitutions =  "heldPercentInstitutions"
        case netIncomeToCommon =  "netIncomeToCommon"
        case trailingEps =  "trailingEps"
        case SandP52WeekChange =  "SandP52WeekChange"
        case priceToBook =  "priceToBook"
        case heldPercentInsiders =  "heldPercentInsiders"
        case nextFiscalYearEnd =  "nextFiscalYearEnd"
        case mostRecentQuarter =  "mostRecentQuarter"
        case shortRatio =  "shortRatio"
        case sharesShortPreviousMonthDate =  "sharesShortPreviousMonthDate"
        case floatShares =  "floatShares"
        case enterpriseValue =  "enterpriseValue"
        case lastSplitDate =  "lastSplitDate"
        case lastSplitFactor =  "lastSplitFactor"
        case earningsQuarterlyGrowth =  "earningsQuarterlyGrowth"
        case dateShortInterest =  "dateShortInterest"
        case pegRatio =  "pegRatio"
        case shortPercentOfFloat =  "shortPercentOfFloat"
        case sharesShortPriorMonth =  "sharesShortPriorMonth"
        case regularMarketPrice =  "regularMarketPrice"
        case logo_url =  "logo_url"
        case generalPublicHolding = "generalPublicHolding"
    }
}
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
