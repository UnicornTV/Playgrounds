import Foundation

// Initialize an instance of the MeasurementFormatter class
// The default measurement formatter is not very helpful, converting feet to miles
// The first prints as: "10.0 ft"
// The second line prints as: "0.002 mi"
let komodoMeasurement = Measurement(value: 10, unit: UnitLength.feet)
MeasurementFormatter().string(from: komodoMeasurement)



// You would probably collect this from a UIPickerView
// and replace "en_US" with the result of the picker
// maybe falling back to a default like the "en_US"
UserDefaults.standard.set("en_US", forKey: "locale")

// From this point on, we would want to refer to the saved preference
// First we will create an MeasurementFormatter instance that we can configure
// Then we retrieve the string identifier from UserDefaults with a default fallback
// Last we initiate our Locale class with this identifier
let measurementFormatter = MeasurementFormatter()
let preferredLocaleIdentifier = UserDefaults.standard.object(forKey: "locale") ?? "en_US"
let preferredLocale = Locale(identifier: preferredLocaleIdentifier as! String)

// Optionally set the `locale` property of our instance.
// If we do not set this, it will default to the user's device locale
measurementFormatter.locale = preferredLocale

// If we print now, we'll see "0.002 mi"
measurementFormatter.string(from: komodoMeasurement)



// Optionally set the `unitOptions` property
// This can be: .providedUnit, .naturalScale, or .temperatureWithoutUnit 
// Options provided by MeasurementFormatter.UnitOptions
// This defaults to a privately defined format if unset
measurementFormatter.unitOptions = .naturalScale

// If we print our string, we'll see "10 ft"
measurementFormatter.string(from: komodoMeasurement)

// Optionally set the `unitStyle` property
// This can be: .short, .medium or .long
// Options provided by Formatter.UnitStyle and defaults to .medium if unset
measurementFormatter.unitStyle = .long

// If we print our string, we'll see "10 feet"
measurementFormatter.string(from: komodoMeasurement)



// Set the `numberFormatter` property to a customized instance of NumberFormatter
// This can be: .none, .decimal, .currency, .percent, .scientific, .spellOut
// Options provided by NumberFormatter.Style and defaults to .decimal if unset
let numberFormatter = NumberFormatter()
numberFormatter.numberStyle = .spellOut
measurementFormatter.numberFormatter = numberFormatter

// If we print our string, we'll see "ten feet"
measurementFormatter.string(from: komodoMeasurement)