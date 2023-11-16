//
//  ContentView.swift
//  InterviewAPI
//
//  Created by Asher McConnell on 11/16/23.
//

import SwiftUI

struct ContentView: View {
    
    @Bindable var vm = OrderData()
    
    var body: some View {
        ScrollView {
            VStack {
                if let results = vm.orders?.results {
                    ForEach(results, id: \.id) { order in
                        ZStack {
                            OrderView(order: order)
                        }
                        
                    }
                }
            }
            .task {
                await vm.fetchDataFromAPI()
            }
            .padding()
        }
    }

}
#Preview {
    ContentView()
}

// MARK: VIEWS

extension ContentView {
    var orderCard: some View {
        ZStack {
            
        }
    }
}
