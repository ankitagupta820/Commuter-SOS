//
//  MainVM.swift
//  HooHacks
//
//  Created by Ankita Gupta on 27/03/21.
//

import Foundation

import Foundation
import SwiftyJSON
import Alamofire
import CoreLocation

class HomeVM: ObservableObject{
    
    @Published var amenity: Bool = false
    @Published var crossing: Bool = false
    @Published var giveway: Bool = false
    @Published var junc: Bool = false
    @Published var noexit: Bool = false
    @Published var railway: Bool = false
    @Published var roundabout: Bool = false
    @Published var station: Bool = false
    @Published var stop: Bool = false
    @Published var calming: Bool = false
    @Published var signal: Bool = false
    @Published var loop: Bool = false
    @Published var bump: Bool = false
    @Published var side: Bool = false
    
    var lat: String = ""
    var long: String = ""
    var temp: String = ""
    var hum: String = ""
    var pressure: String = ""
    var visibility: String = ""
    var windspeed: String = ""
    var weather: String = ""
    
    
    var cloudy: String = "0"
    var rainfall: String = "0"
    var foggy: String = "0"
    var hailstrom: String = "0"
    var sandstorm: String = "0"
    var smoke: String = "0"
    var snowfall: String = "0"
    var storm: String = "0"
    var tornado: String = "0"
    var wind: String = "0"
    
    @Published var severity: String = ""
    @Published var showSeverity: Bool = false
    @Published var advise: String = ""
    
    
    
    func getWeather(){
        
        let URL: String="http://api.openweathermap.org/data/2.5/weather?lat=\(self.lat)&lon=\(self.long)&appid=13746203c44003d161c21bd7b43c2108"
        
        print("Latitude:", self.lat)
        print("Longitiude:", self.long)
        print(URL)
        
        let url: String = URL
        AF.request(url, encoding:JSONEncoding.default).responseJSON { response in
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                self.weather = json["weather"][0]["main"].stringValue
                self.setWeather()
                self.temp = json["main"]["temp"].stringValue
                self.windspeed = json["wind"]["speed"].stringValue
                self.pressure = json["main"]["pressure"].stringValue
                self.hum = json["main"]["humidity"].stringValue
                self.visibility = json["visibility"].stringValue
                
                
                debugPrint("Weather fetched!")
                self.getData()
                
            case .failure(let error):
                print(error)
            }
        }
    
    }
    
    func setWeather(){
        
        switch self.weather {
        case "Snow":
            self.snowfall="1"
        case "Rain":
            self.rainfall = "1"
        case "Thunderstorm":
            self.storm = "1"
        case "Smoke":
            self.smoke = "1"
        case "Fog":
            self.foggy = "1"
        case " Tornado ":
            self.tornado = "1"
        case "Clouds":
            self.cloudy="1"
        default:
            print(self.weather)
        }
        
    }
    
    func getData(){
        
        let endpoint: String = "http://localhost:5000/predict?lat=\(self.lat)&long=\(self.long)&temp=\(self.temp)&hum=\(self.hum)&pressure=\(self.pressure)&visibility=\(self.visibility)&windspeed=\(self.windspeed)&amenity=\(self.amenity==true ? 1: 0)&bump=\(self.bump == true ? 1: 0)&crossing=\(self.crossing==true ? 1: 0)&giveway=\(self.giveway == true ? 1: 0)&junc=\(self.junc==true ? 1: 0)&noexit=\(self.noexit==true ? 1: 0)&railway=\(self.railway==true ? 1: 0)&roundabout=\(self.roundabout==true ? 1: 0)&station=\(self.station == true ? 1: 0)&stop=\(self.stop==true ? 1: 0)&calming=\(self.calming==true ? 1: 0)&signal=\(self.signal==true ? 1: 0)&loop=\(self.loop==true ? 1: 0)&cloudy=\(self.cloudy)&rainfall=\(self.rainfall)&foggy=\(self.foggy)&hailstorm=\(self.hailstrom)&sandstorm=\(self.sandstorm)&smoke=\(self.smoke)&snowfall=\(self.snowfall)&storm=\(self.storm)&tornado=\(self.tornado)&wind=\(self.wind)&E=1&W=0&N=0&S=1&NE=0&NW=0&SE=0&SW=0&L=0&R=1"
        
        print(endpoint)
        
        let url: String = endpoint
        AF.request(url, encoding:JSONEncoding.default).responseJSON { response in
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                self.severity = json["Severity"].stringValue
                self.advise = json["message"].stringValue
                self.showSeverity=true
                
                print(json)
                debugPrint("Severity fetched!")
                
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    
    func toggle(elem: String){
        
        switch elem {
        case "side":
            side.toggle()
        case "amenity":
            amenity.toggle()
        case "crossing":
            crossing.toggle()
        case "giveway":
            giveway.toggle()
        case "junc":
            junc.toggle()
        case "noexit":
            noexit.toggle()
        case "railway":
            railway.toggle()
        case "roundabout":
            roundabout.toggle()
        case "station":
            station.toggle()
        case "stop":
            stop.toggle()
        case "calming":
            calming.toggle()
        case "signal":
            signal.toggle()
        case "loop":
            loop.toggle()
        case "bump":
            bump.toggle()
        default:
            print("Some other Value")
        }
        
        
        
    }
    
    
    
    
}
