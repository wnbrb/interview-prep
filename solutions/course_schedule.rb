# https://leetcode.com/problems/course-schedule/

def can_finish(num_courses, prerequisites)
  course_hash = {}
  prerequisites.each do |relation|
      if course_hash[relation[1]]
          course_hash[relation[1]] << relation[0]
      else
          course_hash[relation[1]] = [relation[0]]
      end
  end
  # p course_hash

  checked = [] # array of booleans
  path = []    # array of booleans
  num_courses.times do |cur_course|
      return false if isCyclic?(cur_course, course_hash, checked, path)
  end
  return true
end



def isCyclic?(current_course, course_hash, checked, path)
  # base cases

  # this node has been checked, no cycle would be formed with this node.
  return false if checked[current_course]

  # come across a previously visited node, i.e. detect the cycle
  return true if path[current_course]

  # no following courses, no loop
  return false if !course_hash[current_course]

  # before backtracking, mark the node in the path
  path[current_course] = true

  # backtracking
  ret = false
  next_courses = course_hash[current_course]
  next_courses.each do |next_course|
      ret = isCyclic?(next_course, course_hash, checked, path)
      break if ret
  end

  # after the visits of children, we come back to process the node itself
  # remove the node from the path
  path[current_course] = false
  # Now that we've visited the nodes in the downstream,
  # we complete the check of this node.
  checked[current_course] = true
  return ret
end
