/*
 * Copyright 2024 Rundeck, Inc. (http://rundeck.com)
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.rundeck.app.data.providers.v1.execution;

import org.rundeck.app.data.model.v1.execution.RdJobStats;
import org.rundeck.app.data.model.v1.execution.dto.StatsContent;
import org.rundeck.app.data.providers.v1.DataProvider;

public interface JobStatsDataProvider extends DataProvider {

    RdJobStats createJobStats(String jobUuid);
    void deleteByJobUuid(String jobUuid);
    Boolean updateJobStats(String jobUuid, Long eId, long time);
    Boolean updateJobRefStats(String jobUuid, long time);
    StatsContent getStatsContent(String jobUuid);
}
