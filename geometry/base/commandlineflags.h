// Copyright 2010 Google
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#ifndef BASE_COMMANDLINEFLAGS_H
#define BASE_COMMANDLINEFLAGS_H


// All the gflags are moved here.

#define FLAGS_s2debug DEBUG_MODE
//, "Enable debugging checks in s2 code");
#define FLAGS_always_recurse_on_children false
/*            "When we test a query edge against a cell, we don't "
            "recurse if there are only a few test edges in it.  "
            "For testing, it is useful to always recurse to the end.  "
            "You don't want to use this flag anywhere but in tests.");*/


#endif  // BASE_COMMANDLINEFLAGS_H
