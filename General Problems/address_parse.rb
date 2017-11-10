# Break down an address (e.g. 1234 Main St Suite 9B San Francisco CA 94105) into its subparts (address line 1, address line 2, etc).  
# 234 Main St Suite 9B
# San Francisco CA 94105

def breakdown_proper_format(address)
  parsed = address.split(' ')
  zip = parsed[-1] #or regex
  state = parsed[-2] #or regex

  #Now find either city by going back and comparing to database, or ending of street input by going back and finding numbers/key words
  i = parsed.length - 3
  while i >= 0
    if /\d+/ =~parsed[i] || /Floor/ =~parsed[i] #possibly more key words
      break
    else
      i -= 1
    end
  end
  city = parsed[i+1...-2].join(" ")
  street = parsed[0..i].join(" ")
  p street
  p city + " " + state + ", " + zip
end

address = "1234 Main St Suite 9B San Francisco CA 94105"
address2 = "1234 Main St Suite 9B Austin TX 94105"
address3 = "1234 Main St Suite 9B Salt Lake City TX 94105"
address4 = "Expanding Capital 600 California St 11th Floor San Francisco CA 94105"
breakdown_proper_format(address)
breakdown_proper_format(address2)
breakdown_proper_format(address3)
breakdown_proper_format(address4)

#Are line breaks guaranteed? Is order guaranteed?
# -If yes, then we can try manually parsing.
# -If no, then regex might be a better option.

# if /\d\d\d\d\d/ =~ possible_zip
#   p possible_zip
# end

=begin
St + Suite

City
Country
Zipcode
=end
