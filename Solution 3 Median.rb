def find_median_sorted_arrays(nums1, nums2)
  # Ensure nums1 is the smaller array to minimize the search space
  if nums1.length > nums2.length
    nums1, nums2 = nums2, nums1
  end

  m, n = nums1.length, nums2.length
  low, high = 0, m

  while low <= high
    # Partitioning nums1 and nums2
    partition1 = (low + high) / 2
    partition2 = (m + n + 1) / 2 - partition1

    # If partition1 is 0, it means nothing is left on the left side from nums1
    max_left1 = partition1 == 0 ? -Float::INFINITY : nums1[partition1 - 1]
    # If partition1 is m, it means nothing is right on the right side from nums1
    min_right1 = partition1 == m ? Float::INFINITY : nums1[partition1]

    # Same logic for nums2
    max_left2 = partition2 == 0 ? -Float::INFINITY : nums2[partition2 - 1]
    min_right2 = partition2 == n ? Float::INFINITY : nums2[partition2]

    # Check if we found the correct partition
    if max_left1 <= min_right2 && max_left2 <= min_right1
      # If the total number of elements is even
      if (m + n).even?
        return ( [max_left1, max_left2].max + [min_right1, min_right2].min ) / 2.0
      else
        # If the total number of elements is odd
        return [max_left1, max_left2].max
      end
    elsif max_left1 > min_right2
      # Move the partition left in nums1
      high = partition1 - 1
    else
      # Move the partition right in nums1
      low = partition1 + 1
    end
  end

  # If no solution is found, raise an error (in practice, this won't happen)
  raise "Input arrays are not sorted"
end

# Test cases
nums1_1 = [1, 3]
nums2_1 = [2]
puts "Test case 1 result: #{find_median_sorted_arrays(nums1_1, nums2_1)}"  # Expected output: 2.0

nums1_2 = [1, 2]
nums2_2 = [4, 5]
puts "Test case 2 result: #{find_median_sorted_arrays(nums1_2, nums2_2)}"  # Expected output: 2.5
