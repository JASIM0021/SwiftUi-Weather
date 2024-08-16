//
//  ContentView.swift
//  SwiftUi-weather
//
//  Created by Sk Jasimuddin on 13/08/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    var body: some View {
        ZStack {
            
            BackgroundView(isNight: isNight)
            
            VStack(){
                CityTextView(cityName: "Kolkata, IN")
                VStack(spacing:8){
                    Image(systemName: isNight ? "moon.stars.fill" : "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:180,height:180)
                    
                    Text("76̵°")
                        .font(.system(size: 70))
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                    }
                .padding(.bottom,40)
              
                HStack(spacing:20){
                    
                    WeatherDayView(dayOfWeak: "TUE", imageName: "cloud.sun.fill", temprature: 18)
                    WeatherDayView(dayOfWeak: "WED", imageName: "sun.dust.fill", temprature: 18)
                    WeatherDayView(dayOfWeak: "THUS", imageName: "wind", temprature: 18)
                    WeatherDayView(dayOfWeak: "FRI", imageName: "thermometer.high", temprature: 32)
                    WeatherDayView(dayOfWeak: "SUT", imageName: "sun.max.fill", temprature: 18)
                }
                Spacer()
                Button {
                    
                    print("btn clicked")
                    isNight.toggle()
                } label: {
                    Text("Change Day Time")
                }
                .frame(width: 200,height: 50)
                .background(.white)
                .font(.system(size: 20))
                .fontWeight(.bold)
                .cornerRadius(10)
                
                Spacer()
            }
           
            
           
        }
        
        
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayOfWeak : String
    var imageName:String
    var temprature:Int
    var body: some View {
        VStack{
            Text(dayOfWeak)
                .font(.system(size: 16))
                .fontWeight(.medium)
                .foregroundStyle(.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .foregroundStyle(.red, .orange, .green)
                .aspectRatio(contentMode: .fit)
                .frame(width:40,height:40)
            Text("\(temprature)°")
                .font(.system(size: 28))
                .fontWeight(.semibold)
                .foregroundStyle(.white)
        }
    }
}

struct BackgroundView: View {
     var isNight: Bool
    var body: some View {
//        LinearGradient(gradient:
//                        Gradient(colors: [isNight ? .black : .blue , isNight ? .gray : Color("lightBlue")]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing
//        )
//        
//        // MARK: deprecated
////        .edgesIgnoringSafeArea(.all)
//        .ignoresSafeArea()
        
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName : String
    var body: some View {
        Text(cityName)
            .font(.title2)
            .fontWeight(.semibold)
            .fontDesign(.default)
            .foregroundStyle(.white)
            .padding()
    }
}
