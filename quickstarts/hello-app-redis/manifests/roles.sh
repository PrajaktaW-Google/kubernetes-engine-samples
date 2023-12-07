# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# [START gke_quickstarts_hello_app_redis_manifests_roles]
#!/bin/bash
# Usage: ./roles.sh

urls=$(kubectl get pods -l app=redis -o jsonpath='{range.items[*]}{.status.podIP} ')
command="kubectl exec -it redis-0 -- redis-cli --cluster create --cluster-replicas 1 "

for url in $urls
do
    command+=$url":6379 "
done

echo "Executing command: " $command
$command
# [END gke_quickstarts_hello_app_redis_manifests_roles]