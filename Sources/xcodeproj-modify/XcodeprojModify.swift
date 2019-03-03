import Foundation
import PathKit
import xcodeproj

struct XcodeprojModify {
    enum Error: LocalizedError {
        case unknownTarget(String)
        
        var errorDescription: String? {
            switch self {
            case .unknownTarget(let string):
                return "Couldn't find target named \(string)"
            }
        }
    }
    
    private let arguments: [String]

    init(arguments: [String]) {
        self.arguments = arguments
    }
    
    public func run() -> Int32 {
        do {
            let arguments = try Arguments(self.arguments)
            try run(with: arguments)
        } catch {
            print(error.localizedDescription)
            return 1
        }
        return 0
    }
    
    private func run(with arguments: Arguments) throws {
        for command in arguments.commands {
            try runCommand(command, with: arguments)
        }
    }
    
    private func runCommand(_ command: Command, with arguments: Arguments) throws {
        switch command {
        case .addRunScriptPhase(let target, let contents):
            try addRunScriptPhase(target: target, contents: contents, xcodeprojPath: arguments.xcodeprojPath)
        }
    }
    
    private func addRunScriptPhase(target: String, contents: String, xcodeprojPath: String) throws {
        let path = Path(xcodeprojPath)
        let xcodeproj = try XcodeProj(path: path)
        let targets = xcodeproj.pbxproj.targets(named: target)
        guard !targets.isEmpty else {
            throw Error.unknownTarget(target)
        }

        let phase = PBXShellScriptBuildPhase(shellScript: contents)
        xcodeproj.pbxproj.add(object: phase)
        for target in targets {
            target.buildPhases = target.buildPhases + [phase]
        }
        try xcodeproj.write(path: path)
    }
}
