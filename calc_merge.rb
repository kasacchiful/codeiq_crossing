
require 'pp'

start_time = Time.now
@count = 0

def merge_sort lst
  return msort lst.dup
end

def msort lst
  return lst if (len = lst.size) <= 1

  lst2 = lst.pop(len >> 1)
  return merge(merge_sort(lst), merge_sort(lst2))
end

def merge lst1, lst2
  len1, len2 = lst1.size, lst2.size
  result = Array.new(len1 + len2)
  a, b = lst1.first, lst2.first
  i, j, k = 0, 0, 0

  loop do
    if a <= b
      result[i] = a
      i += 1; j += 1
      break unless j < len1
      a = lst1[j]
    else
      @count += (len1 + k - i)
      result[i] = b
      i += 1; k += 1
      break unless k < len2
      b = lst2[k]
    end
  end

  while j < len1 do
    result[i] = lst1[j]
    i += 1; j += 1
  end
  while k < len2 do
    result[i] = lst2[k]
    i += 1; k += 1
  end

  return result
end

#fname = "./sample.txt"
fname = "./crossing.txt"
sorted = nil

a = []
File.open(fname, "r") do |f|
  f.each do |line|
    a << line.chomp.to_i
  end

#  pp (merge_sort a)
#  sorted = merge_sort a
  merge_sort a
  pp @count
end

puts Time.now - start_time

#puts "#{sorted[0]}, #{sorted[1]}, #{sorted[2]}, ... , #{sorted[-2]}, #{sorted[-1]}"
