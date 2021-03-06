//
//  Fixtures.swift
//  pxctest
//
//  Created by Johannes Plunien on 27/11/16.
//  Copyright © 2016 Johannes Plunien. All rights reserved.
//

import FBSimulatorControl
import Foundation
@testable import PXCTestKit

let fixtures = Fixtures()

final class Fixtures {

    private var bundle: Bundle {
        return Bundle(for: type(of: self))
    }

    var testRuntimeInput: URL {
        return bundle.url(forResource: "runtime", withExtension: "json")!
    }

    var textFilePath: String {
        return bundle.path(forResource: "something", ofType: "txt")!
    }

    // MARK: - Sample.app

    var sampleAppTestRun: URL {
        return bundle.url(forResource: "Sample_iphonesimulator10.3-x86_64", withExtension: "xctestrun")!
    }

    var testSampleAppTestRunOnlyFailingTestsOutput: String {
        return try! String(contentsOf: bundle.url(forResource: "testSampleAppTestRunOnlyFailingTests", withExtension: "expected_output")!)
    }

    var testSampleAppTestRunOnlySuccessfulTestsOutput: String {
        return try! String(contentsOf: bundle.url(forResource: "testSampleAppTestRunOnlySuccessfulTests", withExtension: "expected_output")!)
    }

    var testSampleAppTestRunOnlyOneTarget: String {
        return try! String(contentsOf: bundle.url(forResource: "testSampleAppTestRunOnlyOneTarget", withExtension: "expected_output")!)
    }

    var testSampleAppTestRunOnlyOneTargetWithEmptyTestsToRun: String {
        return try! String(contentsOf: bundle.url(forResource: "testSampleAppTestRunOnlyOneTargetWithEmptyTestsToRun", withExtension: "expected_output")!)
    }

    var testSampleAppTestRunRunWithAllTargetsAndJSONReporter: String {
        return try! String(contentsOf: bundle.url(forResource: "testSampleAppTestRunRunWithAllTargetsAndJSONReporter", withExtension: "expected_output")!)
    }

    var testListSampleAppTests: String {
        return try! String(contentsOf: bundle.url(forResource: "testListSampleAppTests", withExtension: "expected_output")!)
    }

    // MARK: - Crash.app

    var crashAppTestRun: URL {
        return bundle.url(forResource: "Crash_iphonesimulator10.3-x86_64", withExtension: "xctestrun")!
    }

    // MARK: - FBSimulatorControl

    let simulatorOptions = SimulatorOptions(
        allocationOptions: [.create, .reuse],
        bootOptions: [.awaitServices, .enableDirectLaunch],
        managementOptions: []
    )
    let timeout = 180.0
    let simulatorConfigurations = [
        FBSimulatorConfiguration.iPhone6().iOS_9_3(),
        FBSimulatorConfiguration.iPadAir().iOS_9_3(),
    ]

    // MARK: - Helper

    func createNewTemporaryDirectory() throws -> URL {
        let temporaryDirectory = URL(fileURLWithPath: "\(NSTemporaryDirectory())/\(UUID().uuidString)")
        try FileManager.default.createDirectory(at: temporaryDirectory, withIntermediateDirectories: true, attributes: nil)
        return temporaryDirectory
    }

}
