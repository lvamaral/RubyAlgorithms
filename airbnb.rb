def palindrome_pairs(words)
    pairs = []
    map = {}
    words.each_with_index do |word, i|
        map[word.reverse] = i
    end
    words.each_with_index do |word, i|
        j = 0
        while j <= word.length
            pref = word[0...j]
            suf = word[j..-1]
            if is_palindrome?(pref)
                if  map[suf] && map[suf] != i
                    pairs << [map[suf], i]
                end
            end
            if j != word.length && is_palindrome?(suf)
                if map[pref] && map[pref] != i
                    pairs << [i, map[pref]]
                end
            end
            j += 1
        end

    end
    pairs
end

def is_palindrome?(word)
    word == word.reverse
end

#O(n*k^2)
#The basic idea is to check each word for prefixes (and suffixes) that are themselves palindromes. If you find a prefix that is a valid palindrome, then the suffix reversed can be paired with the word in order to make a palindrome. It's better explained with an example.
# words = ["bot", "t", "to"]
# Starting with the string "bot". We start checking all prefixes. If "", "b", "bo", "bot" are themselves palindromes. The empty string and "b" are palindromes. We work with the corresponding suffixes ("bot", "ot") and check to see if their reverses ("tob", "to") are present in our initial word list. If so (like the word to"to"), we have found a valid pairing where the reversed suffix can be prepended to the current word in order to form "to" + "bot" = "tobot".
#
# You can do the same thing by checking all suffixes to see if they are palindromes. If so, then finding all reversed prefixes will give you the words that can be appended to the current word to form a palindrome.
#
# The process is then repeated for every word in the list. Note that when considering suffixes, we explicitly leave out the empty string to avoid counting duplicates. That is, if a palindrome can be created by appending an entire other word to the current word, then we will already consider such a palindrome when considering the empty string as prefix for the other word.

class Vector2D
    # @param {Integer[][]} vec2d
    def initialize(vec2d)
        @col = 0
        @row = 0
        @this = vec2d

    end

    # @return {Boolean}
    def has_next
        while @row < @this.count
            if @col < @this[@row].count
                return true
            end
            @col = 0
            @row +=1
        end
        return false
    end

    def next
        value = @this[@row][@col]
        @col += 1
        return value
    end
end

# Your Vector2D will be called like this:
# i, v = Vector2D.new(vec2d), []
# while i.has_next()
#    v << i.next
# end
