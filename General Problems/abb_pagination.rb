# Complete the function below.
require 'set'
def paginate(num, results)
    output = []
    #lets reset this each time we reach the page limit
    hosts_page = Set.new
    page_results = 0

    i = 0
    while i < results.length
        result = results[i]
        host_id = result.split(",")[0]
        if !hosts_page.include?(host_id)
            page_results += 1
            output << result
            results.delete_at(i)
            #go back one index to make sure we dont skip a result
            i = -1
            hosts_page.add(host_id)
        end
        i += 1
        #reset page and host counters if we reach num
        if page_results >= num
            output << ""
            page_results = 0
            hosts_page.clear
            i = 0
        end
    end

    #if results is not empty, we take top result each time and add to page, making sure to paginate
    while !results.empty?
        if page_results >= num
            output << ""
            page_results = 0
            hosts_page.clear
        end
        output << results.shift
        page_results += 1
    end

    output
end

#V2
# require 'set'
# resultsPerPage = 5;
# results = [
#   "1,28,300.6,San Francisco",
#   "4,5,209.1,San Francisco",
#   "20,7,203.4,Oakland",
#   "6,8,202.9,San Francisco",
#   "6,10,199.8,San Francisco",
#   "1,16,190.5,San Francisco",
#   "6,29,185.3,San Francisco",
#   "7,20,180.0,Oakland",
#   "6,21,162.2,San Francisco",
#   "2,18,161.7,San Jose",
#   "2,30,149.8,San Jose",
#   "3,76,146.7,San Francisco",
#   "2,14,141.8,San Jose",
# ]
# length = 13
#
# resultsPerPage1 = 3;
# results1 = [
#    "1,28,100.3,Paris",
#    "4,5,99.2,Paris",
#    "2,7,90.5,Paris",
#    "8,8,87.6,Paris",
#    "6,10,85.6,Paris",
#    "3,16,82.16,Paris",
#    "7,29,81.1,Paris",
#    "9,20,78.9,Paris",
#    "12,21,74.3,Paris"
#    ]
# length1 = 9
#
# def paginator(results, per_page, length)
#   n_pages = length / per_page
#   remainder = length % per_page
#   last_ones = []
#   if remainder != 0
#     pages = Array.new(n_pages + 1) {Array.new}
#     page_sets = Array.new(n_pages + 1) {Set.new}
#   else
#     pages = Array.new(n_pages) {Array.new}
#     page_sets = Array.new(n_pages) {Set.new}
#   end
#   results.length.times do
#     result = results.shift
#     host_id = result.split(',')[0]
#     added = false
#     pages.each_with_index do |page, i|
#       if !page_sets[i].include?(host_id) && page.length < per_page
#         added = true
#         page << result
#         page_sets[i].add(host_id)
#         break
#       end
#     end
#     last_ones << result unless added
#   end
#
#   while !last_ones.empty?
#     result = last_ones.shift
#     pages[-1] << result
#   end
#   pages.each do |page|
#     puts page
#     puts "###"
#   end
# end
#
# paginator(results1, resultsPerPage1, length1)
