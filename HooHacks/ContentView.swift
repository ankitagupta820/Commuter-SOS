//
//  ContentView.swift
//  HooHacks
//
//  Created by Ankita Gupta on 27/03/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var showSeverity: Bool = false
    @ObservedObject var HomeVM: HomeVM
    
    @ObservedObject var locationManager = LocationManager()
    
    
    var body: some View {
        
            NavigationView{
            
                ScrollView{
                  
                    Section(header: HStack{
                        Image(systemName: "car")
                        Text("Traffic Conditions").font(.title)
                    }) {
                        
                        HStack{
                            
                            VStack(alignment: .leading){
                                Button(action: {HomeVM.toggle(elem: "amenity")}){
                                    HStack{
                                        Image(systemName: HomeVM.amenity ? "checkmark.square": "square")
                                        Text("Amenity")
                                    }
                                    
                                }
                                Button(action: {HomeVM.toggle(elem: "crossing")}){
                                    HStack{
                                        Image(systemName: HomeVM.crossing ? "checkmark.square": "square")
                                        Text("Crossing")
                                    }
                                    
                                }
                                Button(action: {HomeVM.toggle(elem: "giveway")}){
                                    HStack{
                                        Image(systemName: HomeVM.giveway ? "checkmark.square": "square")
                                        Text("Give Way")
                                    }
                                    
                                }
                                Button(action: {HomeVM.toggle(elem: "junc")}){
                                    HStack{
                                        Image(systemName: HomeVM.junc ? "checkmark.square": "square")
                                        Text("Junction")
                                    }
                                    
                                }
                                Button(action: {HomeVM.toggle(elem: "noexit")}){
                                    HStack{
                                        Image(systemName: HomeVM.noexit ? "checkmark.square": "square")
                                        Text("No Exit")
                                    }
                                    
                                }
                                Button(action: {HomeVM.toggle(elem: "railway")}){
                                    HStack{
                                        Image(systemName: HomeVM.railway ? "checkmark.square": "square")
                                        Text("Railway")
                                    }
                                    
                                }
                                
                                Button(action: {HomeVM.toggle(elem: "roundabout")}){
                                    HStack{
                                        Image(systemName: HomeVM.roundabout ? "checkmark.square": "square")
                                        Text("Roundabout")
                                    }
                                    
                                }
                                
                            }.padding()
                            
                            Spacer()
                            VStack(alignment: .leading){
                                
                                Button(action: {HomeVM.toggle(elem: "station")}){
                                    HStack{
                                        Image(systemName: HomeVM.station ? "checkmark.square": "square")
                                        Text("Station")
                                    }
                                    
                                }
                                Button(action: {HomeVM.toggle(elem: "stop")}){
                                    HStack{
                                        Image(systemName: HomeVM.stop ? "checkmark.square": "square")
                                        Text("Stop")
                                    }
                                }
                                
                                Button(action: {HomeVM.toggle(elem: "calming")}){
                                    HStack{
                                        Image(systemName: HomeVM.calming ? "checkmark.square": "square")
                                        Text("Traffic Calming")
                                    }
                                    
                                }
                                
                                
                                Button(action: {HomeVM.toggle(elem: "signal")}){
                                    HStack{
                                        Image(systemName: HomeVM.signal ? "checkmark.square": "square")
                                        Text("Traffic Signal")
                                    }
                                    
                                }
                                
                                Button(action: {HomeVM.toggle(elem: "loop")}){
                                    HStack{
                                        Image(systemName: HomeVM.loop ? "checkmark.square": "square")
                                        Text("Turning Loop")
                                    }
                                    
                                }
                                
                                Button(action: {HomeVM.toggle(elem: "bump")}){
                                    HStack{
                                        Image(systemName: HomeVM.bump ? "checkmark.square": "square")
                                        Text("Bump")
                                    }
                                    
                                }
                            }
                            Spacer()
                        }
                    }
                    
                    
                    HStack{
                        
                        //Reset Button
                        Button{
                            reset()
                        }label:{
                            Text("Reset").frame(width: 130)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.green)
                                .cornerRadius(30)
                        }
                        
                        //Check Button
                        Button{
                            setLocation()
                            self.HomeVM.getWeather()
                            
                            
                        }label:{
                            Text("Report Accident").frame(width: 130)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.green)
                                .cornerRadius(30)
                        }
                    }
                    
                    if self.HomeVM.showSeverity {
                        
                        let sev = self.HomeVM.severity
                        let advise = self.HomeVM.advise
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .fill(Color.red)
                                .opacity(0.5)
                            
                            VStack() {
                                HStack{
                                    Image(systemName: "exclamationmark.triangle.fill").font(.title)
                                    Text("Based on the situation, you may be involved in a casualty of severity")
                                        .fontWeight(.semibold)
                                        .foregroundColor(.black)
                                        .fixedSize(horizontal: false, vertical: true)                            .multilineTextAlignment(.leading)
                                }
                                
                                Text(sev)
                                    .font(.largeTitle)
                                    .font(Font.title.weight(.bold))
                            }
                            .padding(.top, 8)
                            .padding(.bottom, 8)
                            
                        }
                        .frame(width: 350, height: 100)
                        .padding()
                        
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .fill(Color.green)
                                .opacity(0.5)
                            VStack(alignment: .leading){
                                HStack{
                                    Image(systemName: "hand.point.right.fill").font(.title)
                                    Text("Safety Advise")
                                        .fontWeight(.semibold)
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                                ScrollView{
                                    Text(advise)
                                }
                                
                                Spacer()
                            }
                            .padding()
                        }
                        .frame(width: 350, height: 250)
                    }
                }
                
                .navigationTitle("Commuter SOS")
                
            }
            .navigationBarBackButtonHidden(true)
        
    }
    
    
    func setLocation(){
        
        let userLatitude:String = String((self.locationManager.lastLocation?.coordinate.latitude)!)
        let userLongitude:String = String((self.locationManager.lastLocation?.coordinate.longitude)!)
        
        self.HomeVM.lat = userLatitude
        self.HomeVM.long = userLongitude
    }
    
    
    func reset(){
        
        HomeVM.showSeverity = false
        HomeVM.severity = "0"
        HomeVM.amenity = false
        
        HomeVM.crossing = false
        HomeVM.giveway = false
        HomeVM.junc = false
        HomeVM.noexit = false
        HomeVM.railway = false
        HomeVM.roundabout = false
        HomeVM.station = false
        HomeVM.stop = false
        HomeVM.calming = false
        HomeVM.signal = false
        HomeVM.loop = false
        HomeVM.bump = false
        HomeVM.side = false
    }
}

