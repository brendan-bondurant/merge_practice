Look at this case:

  [[1, 2], [2, 3]]

Ruby
These meetings should probably be merged, although they don't exactly "overlap"—they just "touch." Does your method do this?

Look at this case:

  [[1, 5], [2, 3]]

Ruby
Notice that although the second meeting starts later, it ends before the first meeting ends. Does your method correctly handle the case where a later meeting is "subsumed by" an earlier meeting?

Look at this case:

  [[1, 10], [2, 6], [3, 5], [7, 9]]

Ruby
Here all of our meetings should be merged together into just [1, 10]. We need keep in mind that after we've merged the first two we're not done with the result—the result of that merge may itself need to be merged into other meetings as well.

Make sure that your method won't "leave out" the last meeting.