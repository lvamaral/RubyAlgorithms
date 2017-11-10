# class Vector2D
#     # @param {Integer[][]} vec2d
#     def initialize(vec2d)
#         @col = 0
#         @row = 0
#         @this = vec2d
#
#     end
#
#     # @return {Boolean}
#     def has_next
#         while @row < @this.count
#             if @col < @this[@row].count
#                 return true
#             end
#             @col = 0
#             @row +=1
#         end
#         return false
#     end
#
#     def next
#         value = @this[@row][@col]
#         @col += 1
#         return value
#     end
# end

# Your Vector2D will be called like this:
# i, v = Vector2D.new(vec2d), []
# while i.has_next()
#    v << i.next
# end
