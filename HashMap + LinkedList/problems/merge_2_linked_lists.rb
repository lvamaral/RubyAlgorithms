#Uses n space for an array. Could use just O(1) space for a linked list (attaching to next instead of adding nodes to array). Takes O(n + m) time, where n = l1.length, m = l2.length
def mergeTwoLinkedLists(l1, l2)
    result = []
    while l1 || l2
        if l1.nil?
            while l2
                result << l2.value
                l2 = l2.next
            end
            break
        end

        if l2.nil?
            while l1
                result << l1.value
                l1 = l1.next
            end
            break
        end

        if l1.value <= l2.value
            result << l1.value
            l1 = l1.next
        else
            result << l2.value
            l2 = l2.next
        end
    end
    result
end
