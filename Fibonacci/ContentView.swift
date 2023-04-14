//
//  ContentView.swift
//  Fibonacci
//
//  Created by Alexandr on 14.04.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var sequenceLength = 10
    @State private var fibonacciSequence: [UInt64] = []

    var body: some View {
        VStack {
            Text("Fibonacci Sequence")
                .font(.title)
            TextField("Sequence length", value: $sequenceLength, formatter: NumberFormatter())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Text("Enter the number and ")
            Button("Generate") {
                fibonacciSequence = generateFibonacciSequence(length: sequenceLength)
            }

            List(fibonacciSequence, id: \.self) { number in
                Text("\(number)")
            }
            Text("max number is -6,246,583,658,587,674,878, next number will be overflow & crash")
        }
    }

    func generateFibonacciSequence(length: Int) -> [UInt64] {
        var sequence: [UInt64] = [0, 1]
        if length == 0 {
            return []
        } else if length == 1 {
            return [0]
        } else if length == 2 {
            return sequence
        }
        for i in 2..<length {
            let value = sequence[i-1].addingReportingOverflow(sequence[i-2])
            if !value.overflow {
                sequence.append(sequence[i-1] + sequence[i-2])
            } else {
                return sequence
            }
        }
        return sequence
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
