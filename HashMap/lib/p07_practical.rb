require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)
  letters = string.chars
  count = {}
  letters.each do |ch|
    if count[ch]
      count[ch] += 1
    else
      count[ch] = 1
    end
  end
    if letters.length.even?
      return false if count.values.includes(1)
    else
      return false if count.values.count(1) != 1
    end
    true
end
