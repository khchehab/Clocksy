//
//  DigitalDigit.swift
//  Clocksy
//
//  Created by Khaled Chehab on 08/09/2021.
//

import SwiftUI


// MARK: - Private protocols and structs to define the bars for digital digits
private struct DigitalDigitBar {
    static let top = DigitalDigitBar([
        /* Point A: */ CGPoint(x: 2.0  / 15.0, y: 1.5 / 30.0),
        /* Point B: */ CGPoint(x: 3.5  / 15.0, y: 0.0 / 30.0),
        /* Point C: */ CGPoint(x: 11.5 / 15.0, y: 0.0 / 30.0),
        /* Point D: */ CGPoint(x: 13.0 / 15.0, y: 1.5 / 30.0),
        /* Point E: */ CGPoint(x: 11.5 / 15.0, y: 3.0 / 30.0),
        /* Point F: */ CGPoint(x: 3.5  / 15.0, y: 3.0 / 30.0)
    ])
    
    static let topLeft = DigitalDigitBar([
        /* Point A: */ CGPoint(x: 1.5 / 15.0, y: 2.0  / 30.0),
        /* Point B: */ CGPoint(x: 3.0 / 15.0, y: 3.5  / 30.0),
        /* Point C: */ CGPoint(x: 3.0 / 15.0, y: 13.0 / 30.0),
        /* Point D: */ CGPoint(x: 1.5 / 15.0, y: 14.5 / 30.0),
        /* Point E: */ CGPoint(x: 0.0 / 15.0, y: 13.0 / 30.0),
        /* Point F: */ CGPoint(x: 0.0 / 15.0, y: 3.5  / 30.0)
    ])
    
    static let topRight = DigitalDigitBar([
        /* Point A: */ CGPoint(x: 13.5 / 15.0, y: 2.0  / 30.0),
        /* Point B: */ CGPoint(x: 15.0 / 15.0, y: 3.5  / 30.0),
        /* Point C: */ CGPoint(x: 15.0 / 15.0, y: 13.0 / 30.0),
        /* Point D: */ CGPoint(x: 13.5 / 15.0, y: 14.5 / 30.0),
        /* Point E: */ CGPoint(x: 12.0 / 15.0, y: 13.0 / 30.0),
        /* Point F: */ CGPoint(x: 12.0 / 15.0, y: 3.5  / 30.0)
    ])
    
    static let middle = DigitalDigitBar([
        /* Point A: */ CGPoint(x: 2.0  / 15.0, y: 15.0 / 30.0),
        /* Point B: */ CGPoint(x: 3.5  / 15.0, y: 13.5 / 30.0),
        /* Point C: */ CGPoint(x: 11.5 / 15.0, y: 13.5 / 30.0),
        /* Point D: */ CGPoint(x: 13.0 / 15.0, y: 15.0 / 30.0),
        /* Point E: */ CGPoint(x: 11.5 / 15.0, y: 16.5 / 30.0),
        /* Point F: */ CGPoint(x: 3.5  / 15.0, y: 16.5 / 30.0)
    ])
    
    static let bottomLeft = DigitalDigitBar([
        /* Point A: */ CGPoint(x: 1.5 / 15.0, y: 15.5 / 30.0),
        /* Point B: */ CGPoint(x: 3.0 / 15.0, y: 17.0 / 30.0),
        /* Point C: */ CGPoint(x: 3.0 / 15.0, y: 26.5 / 30.0),
        /* Point D: */ CGPoint(x: 1.5 / 15.0, y: 28.0 / 30.0),
        /* Point E: */ CGPoint(x: 0.0 / 15.0, y: 26.5 / 30.0),
        /* Point F: */ CGPoint(x: 0.0 / 15.0, y: 17.0 / 30.0)
    ])
    
    static let bottomRight = DigitalDigitBar([
        /* Point A: */ CGPoint(x: 13.5 / 15.0, y: 15.5 / 30.0),
        /* Point B: */ CGPoint(x: 15.0 / 15.0, y: 17.0 / 30.0),
        /* Point C: */ CGPoint(x: 15.0 / 15.0, y: 26.5 / 30.0),
        /* Point D: */ CGPoint(x: 13.5 / 15.0, y: 28.0 / 30.0),
        /* Point E: */ CGPoint(x: 12.0 / 15.0, y: 26.5 / 30.0),
        /* Point F: */ CGPoint(x: 12.0 / 15.0, y: 17.0 / 30.0)
    ])
    
    static let bottom = DigitalDigitBar([
        /* Point A: */ CGPoint(x: 2.0  / 15.0, y: 28.5 / 30.0),
        /* Point B: */ CGPoint(x: 3.5  / 15.0, y: 27.0 / 30.0),
        /* Point C: */ CGPoint(x: 11.5 / 15.0, y: 27.0 / 30.0),
        /* Point D: */ CGPoint(x: 13.0 / 15.0, y: 28.5 / 30.0),
        /* Point E: */ CGPoint(x: 11.5 / 15.0, y: 30.0 / 30.0),
        /* Point F: */ CGPoint(x: 3.5  / 15.0, y: 30.0 / 30.0)
    ])
    
    static let topSeparator = DigitalDigitBar([
        /* Point A */ CGPoint(x: 7.5  / 15.0, y: 2.0  / 30.0),
        /* Point B */ CGPoint(x: 13.0 / 15.0, y: 7.5  / 30.0),
        /* Point C */ CGPoint(x: 7.5  / 15.0, y: 13.0 / 30.0),
        /* Point D */ CGPoint(x: 2.0  / 15.0, y: 7.5  / 30.0)
    ])
    
    static let bottomSeparator = DigitalDigitBar([
        /* Point A */ CGPoint(x: 7.5  / 15.0, y: 17.0 / 30.0),
        /* Point B */ CGPoint(x: 13.0 / 15.0, y: 22.5 / 30.0),
        /* Point C */ CGPoint(x: 7.5  / 15.0, y: 28.0 / 30.0),
        /* Point D */ CGPoint(x: 2.0  / 15.0, y: 22.5 / 30.0)
    ])
    
    let ratios: [CGPoint]
    
    private init(_ ratios: [CGPoint]) {
        self.ratios = ratios
    }
}

private protocol DigitalDigit: DigitBaseView {
    var bars: [DigitalDigitBar] { get }
}

private extension DigitalDigit {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        for bar in bars {
            path.addLines(bar.ratios.compactMap { $0 * rect })
        }
        
        return path
    }
}

// MARK: - Digital digit structs
enum DigitalDigits {
    static let digits: [AnyView] = [ AnyView(DigitalDigits.Zero()), AnyView(DigitalDigits.One()), AnyView(DigitalDigits.Two()), AnyView(DigitalDigits.Three()), AnyView(DigitalDigits.Four()), AnyView(DigitalDigits.Five()), AnyView(DigitalDigits.Six()), AnyView(DigitalDigits.Seven()), AnyView(DigitalDigits.Eight()), AnyView(DigitalDigits.Nine()) ]
    static let separator: AnyView = AnyView(Separator())
    
    fileprivate struct Zero: DigitalDigit {
        var bars: [DigitalDigitBar] = [ .top, .topLeft, .topRight, .bottomLeft, .bottomRight, .bottom ]
    }

    fileprivate struct One: DigitalDigit {
        var bars: [DigitalDigitBar] = [ .topRight, .bottomRight ]
    }

    fileprivate struct Two: DigitalDigit {
        var bars: [DigitalDigitBar] = [ .top, .topRight, .middle, .bottomLeft, .bottom ]
    }

    fileprivate struct Three: DigitalDigit {
        var bars: [DigitalDigitBar] = [ .top, .topRight, .middle, .bottomRight, .bottom ]
    }

    fileprivate struct Four: DigitalDigit {
        var bars: [DigitalDigitBar] = [ .topLeft, .middle, .topRight, .bottomRight ]
    }

    fileprivate struct Five: DigitalDigit {
        var bars: [DigitalDigitBar] = [ .top, .topLeft, .middle, .bottomRight, .bottom ]
    }

    fileprivate struct Six: DigitalDigit {
        var bars: [DigitalDigitBar] = [ .top, .topLeft, .middle, .bottomLeft, .bottom, .bottomRight ]
    }

    fileprivate struct Seven: DigitalDigit {
        var bars: [DigitalDigitBar] = [ .top, .topRight, .bottomRight ]
    }

    fileprivate struct Eight: DigitalDigit {
        var bars: [DigitalDigitBar] = [ .top, .topLeft, .topRight, .middle, .bottomLeft, .bottomRight, .bottom ]
    }

    fileprivate struct Nine: DigitalDigit {
        var bars: [DigitalDigitBar] = [ .top, .topLeft, .topRight, .middle, .bottomRight, .bottom ]
    }
    
    fileprivate struct Separator: DigitalDigit {
        var bars: [DigitalDigitBar] = [ .topSeparator, .bottomSeparator ]
    }
}
