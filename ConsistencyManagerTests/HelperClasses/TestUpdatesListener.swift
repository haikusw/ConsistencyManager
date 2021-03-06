// © 2016 LinkedIn Corp. All rights reserved.
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at  http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.

import Foundation
import ConsistencyManager

class TestUpdatesListener: ConsistencyManagerUpdatesListener {

    var updateClosure: ((ConsistencyManagerModel, [String : ModelChange], Any?) -> Void)?

    func consistencyManager(_ consistencyManager: ConsistencyManager,
                            updatedModel model: ConsistencyManagerModel,
                            changes: [String : ModelChange],
                            context: Any?) {
        updateClosure?(model, changes, context)
    }
}

extension ModelChange {
    /**
     Simple helper to get out the models from a ModelChange object assuming it's .updated.
     */
    var models: [ConsistencyManagerModel] {
        switch self {
        case .updated(let models):
            return models
        case .deleted:
            return []
        }
    }
}
