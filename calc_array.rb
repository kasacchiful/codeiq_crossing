
#require "ruby-prof"

start_time = Time.now

## binary search
#class Array
#  def binarysearch(key, left = 0, right = self.length - 1)
#     return nil if left > right
#     mid = (left + right) / 2
#     key < self[mid] ? (right = mid - 1) : (left = mid + 1)
#     key == self[mid] ? mid : binarysearch(key, left, right)
#   end
# end

def bsearch(ary, key, left, right)
  return nil if left > right
  mid = (left + right) / 2
  key < ary[mid] ? (right = mid - 1) : (left = mid + 1)
  key == ary[mid] ? mid : bsearch(ary, key, left, right)
end

## read file.
# fname = "./sample.txt"
 fname = "./crossing.txt"
#fname = "./test.txt"
#c = 0

File.open(fname, "r") do |f|
  j = f.read.count("\n")
  f.rewind

  tops = [*1..j]
  cross = 0
  f.each do |line|
    n = line.chomp.to_i
    j -= 1
    i = bsearch(tops, n, 0, j)
    cross += i
    tops.delete_at(i)
  end

  puts cross
end

puts Time.now - start_time
