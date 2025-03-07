//
//  ContentView.swift
//  level1ieeecs
//
//  Created by Anushka Gattani on 06/03/25.
//
//


import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                // Top HStack with NavigationLink
                HStack {
                    //CLICK ON IT TO GET BALANCE DETAILS
                    NavigationLink(destination: viewbalance()) {
                        VStack(alignment: .center) {
                            Image(systemName: "desktopcomputer")
                                .imageScale(.large)
                                .foregroundColor(.white)
                            Text("View Balance")
                                .foregroundColor(.white)
                        }
                    }
                    
                    Spacer()
                    //CLICK ON IT TO ADD EXPENSES
                    NavigationLink(destination: AddExpenseView()) {
                        VStack(alignment: .center) {
                            Image(systemName: "play.circle")
                                .imageScale(.large)
                                .foregroundColor(.white)
                            Text("Add Expense")
                                .foregroundColor(.white)
                        }
                    }
                    
                    
                    Spacer()
                    //CLICK ON IT TO GET PAYMENT DETAILS
                    NavigationLink(destination: viewpayment()) {
                        VStack(alignment: .center) {
                            Image(systemName: "menucard.fill")
                                .imageScale(.large)
                                .foregroundColor(.white)
                            Text("Payment")
                                .foregroundColor(.white)
                        }
                    }
                    
                }
                .padding()
                .background(Color.blue)
                
                Spacer()
                
   
                Text("EXPENSE TRACKER APP")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Image("dollar")
                    .resizable()
                    .frame(width: 350, height: 350)
                
                Spacer()
                
                // Bottom HStack
                HStack(alignment: .bottom) {
                    VStack(alignment: .center) {
                        Image(systemName: "house")
                            .imageScale(.large)
                            .foregroundStyle(.tint)
                        Text("Home")
                    }
                    
                    Spacer()
                    
                    //CLICK ON IT TO GET PROFILE DETAILS
                    NavigationLink(destination: profile()) {
                        VStack(alignment: .center) {
                            Image(systemName: "person.fill")
                                .imageScale(.large)
                                .foregroundStyle(.tint)
                            Text("Profile")
                        }
                    }
                    
                    
                    Spacer()
                    
                    VStack(alignment: .center) {
                        Image(systemName: "chevron.forward")
                            .imageScale(.large)
                            .foregroundStyle(.tint)
                        Text("Menu")
                    }
                }
                .padding()
            }
            .padding()
        }
    }
}


struct profile: View {
    var body: some View {
        ZStack{
            
            
                
            VStack{
                Image(systemName: "person.fill")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .padding()
                    
                Text("Name: Anushka Gattani")
                    .font(.title2)
                Text("Bank Account Number: XXXXXX4521")
                    .font(.title2)
                Text("Phone no: 6439181276")
                    .font(.title2)
            }
        }
    }
}



struct viewpayment: View {
    var body: some View {
        ZStack{
            VStack{
                Text("Your recent payments: ")
                    .font(.title)
                    .padding()
                
                Text("Payment 1: $1000")
                    .font(.headline)
                    .padding()
                
                Text("Payment 2: $1000")
                    .font(.headline)
                    .padding()
                
            }
            
            
        }
        
    }
}


struct AddExpenseView: View {
    @State private var amount: String = ""
    @State private var expenses: [String] = []
    
    var body: some View {
        VStack {
            // Title
            Text("ADD EXPENSE")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            // Input Field
            TextField("Enter amount", text: $amount)
                .keyboardType(.decimalPad)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal)
            
            // Add Expense Button
            Button(action: {
                if !amount.isEmpty {
                    expenses.append(amount)
                    amount = ""                 }
            }) {
                Text("Add Expense")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            
            // Display Expenses in a ScrollView
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(expenses, id: \.self) { expense in
                        Text("$\(expense)")
                            .font(.body)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
            
            Spacer()
        }
    }
}


struct viewbalance: View {
    var body: some View {
        
        ZStack{
            Image("money")
                .resizable()
                .ignoresSafeArea(edges: .all)
            VStack{
                Text("  Current Balance is: ")
                    .font(.title)
                
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white)
                    .padding()
                Text("  $45,000")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white)
                    .padding()
                
            }
            
        }
        
        
    }
}


#Preview {
    ContentView()
}
