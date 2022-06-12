//
//  ViewController.swift
//  ModernCalendar
//
//  Created by Rizwan Ahmed on 11/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupCalendarView()
    }
    
    private func setupCalendarView() {
        let calendarView = UICalendarView()
        let gregorianCalendar = Calendar(identifier: .gregorian)
        calendarView.calendar = gregorianCalendar
        //        calendarView.locale = Locale(identifier: "zh_TW")
        calendarView.fontDesign = .rounded
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(calendarView)
        NSLayoutConstraint.activate([
            calendarView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            calendarView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            calendarView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
        ])
        calendarView.backgroundColor = .secondarySystemBackground
        calendarView.layer.cornerCurve = .continuous
        calendarView.layer.cornerRadius = 10.0
        calendarView.tintColor = UIColor.systemTeal
        
        calendarView.delegate = self
        //        calendarView.wantsDateDecorations = true
        calendarView.availableDateRange = DateInterval.init(start: Date.now, end: Date.distantFuture)
        let dateSelection = UICalendarSelectionMultiDate(delegate: self)
        calendarView.selectionBehavior = dateSelection
    }
    
    
}

extension ViewController: UICalendarViewDelegate {
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        let font = UIFont.systemFont(ofSize: 10)
        let configuration = UIImage.SymbolConfiguration(font: font)
        let image = UIImage(systemName: "star.fill", withConfiguration: configuration)?.withRenderingMode(.alwaysOriginal)
        return .image(image)
    }
}

extension ViewController: UICalendarSelectionSingleDateDelegate {
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        print("Selected Date:",dateComponents ?? "No selection")
    }
    
    func dateSelection(_ selection: UICalendarSelectionSingleDate, canSelectDate dateComponents: DateComponents?) -> Bool {
        return true
    }
}

extension ViewController: UICalendarSelectionMultiDateDelegate {
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, didSelectDate dateComponents: DateComponents) {
        print("Selected Date:",dateComponents)
    }
    
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, didDeselectDate dateComponents: DateComponents) {
        print("De-Selected Date:",dateComponents)
    }
    
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, canSelectDate dateComponents: DateComponents) -> Bool {
        return true
    }
    
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, canDeselectDate dateComponents: DateComponents) -> Bool {
        return true
    }
    
}

