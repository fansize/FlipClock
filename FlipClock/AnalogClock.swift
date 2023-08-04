//
//  AnalogClock.swift
//  FlipClock
//
//  Created by 唐浪 on 2023/8/4.
//

import SwiftUI

struct AnalogClock: View {
    
    var body: some View {
        GeometryReader { geo in
            var radius = geo.size.width < geo.size.height ? geo.size.width : geo.size.height
            
            ZStack {
                Circle()
                    .opacity(0.1)

                // Seconds and minute dots
                ForEach(0..<60) { i in
                    Rectangle()
                        .fill(Color.primary)
                        .frame(width: 2, height: (i % 5) == 0 ? 15 : 5)
                        .offset(y: (radius - 30) / 2)
                        .rotationEffect(.init(degrees: Double(i) * 6))
                }
                
                // second hand
                Rectangle()
                    .fill(Color.primary)
                    .frame(width: 2, height: (radius - 100) / 2)
                    .offset(y: (radius - 220) / 2)
                
                
                // dot
                Circle()
                    .fill(Color.primary)
                    .frame(width: 15, height: 15)
            }
        }
        .padding()
    }
}

struct AnalogClock_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
