def merge_ranges(meetings)

  sorted_meetings = meetings.sort_by { |start_time, end_time| [start_time, end_time] }


  merged_meetings = [sorted_meetings[0]]

  sorted_meetings[1..-1].each do |current_meeting_start, current_meeting_end|
    last_merged_meeting_start, last_merged_meeting_end = merged_meetings[-1]

    if current_meeting_start <= last_merged_meeting_end
      merged_meetings[-1] = [
        last_merged_meeting_start,
        [last_merged_meeting_end, current_meeting_end].max
      ]
    else
      merged_meetings << [current_meeting_start, current_meeting_end]
    end
  end

  merged_meetings
end



def run_tests#Add variables if defined outside
  test_cases = [
    {
      description: 'Test Case 1: Merge correctly',
      input: [[0, 1], [3, 5], [4, 8], [10, 12], [9, 10]],
      expected: [[0, 1], [3, 8], [9, 12]],
      assertion: :assert_equal
    },
    {
      description: 'Test Case 2: Should return true',
      input: [[1, 3], [2, 4], [3, 5]],
      expected: true,
      assertion: :assert_true,
      custom_condition: ->(result) { result == [[1, 5]] }
    },
    {
      description: 'Test Case 3: Should return false',
      input: [[1, 3], [2, 4], [3, 5]],
      expected: false,
      assertion: :assert_false,
      custom_condition: ->(result) { result != [[1, 5]] }
    }
  ]
  test_cases.each do |test_case|
    result = merge_ranges(test_case[:input])
    case test_case[:assertion]
    when :assert_equal
      assert_equal(result, test_case[:expected], test_case[:description])
    when :assert_true
      assert_true(test_case[:custom_condition].call(result), test_case[:description])
    when :assert_false
      assert_false(test_case[:custom_condition].call(result), test_case[:description])
    # Add more cases as needed for other assertions
    else
      puts "#{test_case[:description]} ... UNKNOWN ASSERTION TYPE"
    end
  end
end


def assert_true(value, desc)
  puts "#{desc} ... #{value ? 'PASS' : 'FAIL'}"
end

def assert_false(value, desc)
  puts "#{desc} ... #{value ? 'FAIL' : 'PASS'}"
end

def assert_equal(actual, expected, desc)
  if actual == expected
    puts "#{desc} ... PASS"
  else
    puts "#{desc} ... FAIL: Expected #{expected.inspect} but got #{actual.inspect}"
  end
end

def assert_not_equal(actual, expected, desc)
  if actual != expected
    puts "#{desc} ... PASS"
  else
    puts "#{desc} ... FAIL: Did not expect #{actual.inspect}"
  end
end

def assert_greater_than(value, threshold, desc)
  if value > threshold
    puts "#{desc} ... PASS"
  else
    puts "#{desc} ... FAIL: #{value.inspect} is not greater than #{threshold.inspect}"
  end
end

def assert_less_than(value, threshold, desc)
  if value < threshold
    puts "#{desc} ... PASS"
  else
    puts "#{desc} ... FAIL: #{value.inspect} is not less than #{threshold.inspect}"
  end
end

def assert_includes(collection, item, desc)
  if collection.include?(item)
    puts "#{desc} ... PASS"
  else
    puts "#{desc} ... FAIL: #{collection.inspect} does not include #{item.inspect}"
  end
end

def assert_nil(value, desc)
  if value.nil?
    puts "#{desc} ... PASS"
  else
    puts "#{desc} ... FAIL: #{value.inspect} is not nil"
  end
end

def assert_not_nil(value, desc)
  if !value.nil?
    puts "#{desc} ... PASS"
  else
    puts "#{desc} ... FAIL: Value is nil"
  end
end

def assert_empty(collection, desc)
  if collection.empty?
    puts "#{desc} ... PASS"
  else
    puts "#{desc} ... FAIL: #{collection.inspect} is not empty"
  end
end

def assert_not_empty(collection, desc)
  if !collection.empty?
    puts "#{desc} ... PASS"
  else
    puts "#{desc} ... FAIL: #{collection.inspect} is empty"
  end
end


run_tests #might need variables