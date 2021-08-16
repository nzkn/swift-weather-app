import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            
            VStack {
                CityTextView(cityName: "Lviv, Ukraine")
                
                WeatherStatusView(
                    imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                    temperature: 72)
                
                Spacer()
                
                HStack(spacing: 20) {
                    WeatherDayView(
                        dayOfWeek: "MON",
                        imageName: "cloud.sun.fill",
                        temperature: 72)
                    WeatherDayView(
                        dayOfWeek: "TUE",
                        imageName: "sun.dust.fill",
                        temperature: 72)
                    WeatherDayView(
                        dayOfWeek: "WED",
                        imageName: "cloud.sun.fill",
                        temperature: 72)
                    WeatherDayView(
                        dayOfWeek: "THU",
                        imageName: "sun.dust.fill",
                        temperature: 72)
                    WeatherDayView(
                        dayOfWeek: "FRI",
                        imageName: "cloud.moon.bolt.fill",
                        temperature: 72)
                    WeatherDayView(
                        dayOfWeek: "TUE",
                        imageName: "cloud.sun.fill",
                        temperature: 72)
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    DefaultButton(
                        title: "Change Day Time",
                        textColor: .blue,
                        backgroundColor: .white)
                }
                
                Spacer()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek:String
    var imageName:String
    var temperature:Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default)).foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 32, height: 32)
            Text("\(temperature)°")
                .font(.system(size: 24, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient:Gradient(
                        colors: [isNight ? .black : .blue,
                                 isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding(10)
    }
}

struct WeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
    
        }
        .padding(.bottom, 40)
    }
}
