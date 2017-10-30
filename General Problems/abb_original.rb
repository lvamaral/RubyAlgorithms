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
