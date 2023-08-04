//
//  ContentView.swift
//  FlipClock
//
//  Created by 唐浪 on 2023/8/4.
//

import SwiftUI

struct ContentView: View {
    @State var isDark: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Clock")
                        .font(.title)
                        .fontWeight(.heavy)
                    
                    Spacer(minLength: 0)
                    
                    Button {
                        withAnimation {
                            isDark.toggle()
                        }
                    } label: {
                        Image(systemName: isDark ? "sun.min.fill" : "moon.fill")
                            .font(.system(size: 22))
                            .foregroundColor(isDark ? .black : .white)
                            .padding()
                            .background(Color.primary)
                            .clipShape(Circle())
                    }
                }
                .padding()
                
                AnalogClock()
            }
            .preferredColorScheme(isDark ? .dark : .light)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
