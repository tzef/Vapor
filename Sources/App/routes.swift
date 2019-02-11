import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
    
    router.get("yo", String.parameter) { req -> String in
        let name = try  req.parameters.next(String.self)
        return "Yo, \(name)"
    }
    router.get("hello", "vapor") { req in
        return "Hello, world! Vapor"
    }
    router.post(InfoData.self, at: "info") { req, data -> String in
        return "Hello \(data.name)!"
    }
    router.post(InfoData.self, at: "info2") { req, data -> InfoResponse in
        return InfoResponse(request: data)
    }
    router.post("api", "acronyms") { req -> Future<Acronym> in
        return try req.content.decode(Acronym.self)
            .flatMap(to: Acronym.self) { acronym in
                return acronym.save(on: req)
        }
    }
    
    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
}
