//
//  OrderView.swift
//  InterviewAPI
//
//  Created by Asher McConnell on 11/16/23.
//

import SwiftUI

struct OrderView: View {
    
    var order: Resulte
    
    @State var totalPrice = 0.00
    
    var body: some View {
        ZStack {
            
        }
    }
}


// MARK: VIEWS

extension OrderView {
    var some: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .stroke(lineWidth: 3.0)
                .frame(width: 350, height: 300)
            VStack {
                Text("Order")
                    .lineLimit(1)
                    .font(.system(size: 35))
                    .bold()
                    .padding(.top, 15)
                
                Text("****************************************")
                    .bold()
                Spacer()
                VStack {
                    VStack {
                        HStack {
                            Spacer()
                            Text("----- Items Details -----")
                                .font(.system(size: 30))
                                .frame(width: 350)
                                .bold()
                            Spacer()
                        }
                        VStack {
                            
                            Text("Amount of Items: \(order.items.count)")
                            Text("Total Cost of Order: \(totalPrice)")
                        }
                    }
                    VStack {
                        HStack {
                            Spacer()
                            Text("--- Customer Details ---")
                                .font(.system(size: 30))
                                .frame(width: 350)
                                .bold()
                            Spacer()
                        }
                        HStack {
                            Text("Name: \(order.purchaser.name)")
                                .font(.subheadline)
                            Spacer()
                        }
                        HStack {
                            Text("Email Address: \(order.purchaser.emailAddress)")
                                .font(.subheadline)
                            Spacer()
                            
                        }
                        HStack {
                            Text("Address: \(order.purchaser.address)")
                                .font(.subheadline)
                            Spacer()
                        }
                        
                        
                    }
                    .frame(width: 350)
                    .padding(.leading, 15)
                    Text("Tracking #\(order.id)")
                        .frame(width: 300, height: 50)
                        .lineLimit(1)
                        .font(.system(size: 11))
                        .bold()
                        .padding()
                    Spacer()
                }
                
            }
            .frame(width: 320, height: 410)
        }
        .onAppear {
            addToTotal()
        }
    }
}

// MARK: FUNCS

extension OrderView {
    func addToTotal() {
        order.items.forEach({ item in
            totalPrice += item.cost
        })
    }
}

