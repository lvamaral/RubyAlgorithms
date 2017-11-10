def palindrome_pairs(words)
  reverses = {}
  solutions = []
  words.each_with_index {|word,i| reverses[word.reverse] = i }

  words.each_with_index do |word, i|
    (0..word.length).each do |j|
      pre = word[0...j]
      post = word[j..-1]

      #word + another_word
      #(pre + pali(post) + pre.reverse)
      if is_pali?(post) && reverses[pre] && reverses[pre] != i
        solutions << [i, reverses[pre]]
      end
      
      #another_word + word
      # (post.reverse + pali(pre) + post)
      if j>0 && is_pali?(pre) && reverses[post] && reverses[post] != i
        solutions << [reverses[post], i]
      end
    end
  end
  solutions
end

def is_pali?(word)
  word = word.reverse
end

words = ["abcd", "dcba", "lls", "s", "sssll"]

#O(n*k^2)
#The basic idea is to check each word for prefixes (and suffixes) that are themselves palindromes. If you find a prefix that is a valid palindrome, then the suffix reversed can be paired with the word in order to make a palindrome. It's better explained with an example.
# words = ["bot", "t", "to"]
# Starting with the string "bot". We start checking all prefixes. If "", "b", "bo", "bot" are themselves palindromes. The empty string and "b" are palindromes. We work with the corresponding suffixes ("bot", "ot") and check to see if their reverses ("tob", "to") are present in our initial word list. If so (like the word to"to"), we have found a valid pairing where the reversed suffix can be prepended to the current word in order to form "to" + "bot" = "tobot".
#
# You can do the same thing by checking all suffixes to see if they are palindromes. If so, then finding all reversed prefixes will give you the words that can be appended to the current word to form a palindrome.
#
# The process is then repeated for every word in the list. Note that when considering suffixes, we explicitly leave out the empty string to avoid counting duplicates. That is, if a palindrome can be created by appending an entire other word to the current word, then we will already consider such a palindrome when considering the empty string as prefix for the other word.

#In Python:
# class Solution:
#     def palindromePairs(self, words):
#         d, res = dict([(w[::-1], i) for i, w in enumerate(words)]), []
#         for i, w in enumerate(words):
#             for j in range(len(w)+1):
#                 prefix, postfix = w[:j], w[j:]
#
#                 if prefix in d and i != d[prefix] and postfix == postfix[::-1]:
#                     res.append([i, d[prefix]])
#                 if j>0 and postfix in d and i != d[postfix] and prefix == prefix[::-1]:
#                     res.append([d[postfix], i])
#         return res
