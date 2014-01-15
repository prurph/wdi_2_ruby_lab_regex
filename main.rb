require_relative 'source'
require 'pry'

def valid_ip_addresses(source)
  result = source.scan(/(([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\b)/)
  # This gives 2D array b/c there are a bunch of ()
  # We want the first entry of each (the full IP)
  result.map! {|x| x = x[0]}
end

def valid_mit_ip_addresses(source)
   result = source.scan(/(18\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\b)/)
   result.map! {|x| x = x[0]}
end

def non_mit_ip_addresses(source)
  result = source.scan(/((\b[1-9]|[1][0-7]|[1][9]|[2-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\b)/)
  result.map! {|x| x = x[0]}
end

def valid_phone_numbers(source)
  # This also works; less elegant but more exact (provided solution can be
  # tricked with things like 313-4-4555)
  # result = []
  # while source =~ (/([2-9]\d{2}-)?[2-9]\d{2}-\d{4}/)
  #   result.push(source.match(/([2-9]\d{2}-)?[2-9]\d{2}-\d{4}/)[0])
  #   source.sub!(/([2-9]\d{2}-)?[2-9]\d{2}-\d{4}/,"*")
  # end
  # result.uniq
  source.scan(/[2-9]{1}\d{0,2}\-\d{0,3}\-?\d{4}/).uniq
end

def area_codes(source)
  source.scan(/([2-9]\d{2})-[2-9]\d{2}-\d{4}/).uniq.flatten
end

def email_addresses(source)
  # Just a little extra code to also handle tibbon@co.uk.biz.asdf
  source.scan(/(\w+@\w+(\.\w+)+)/).map!{|x| x = x[0]}
end

def zip_codes(source)
  source.scan(/\b\d{5}\b/).uniq
end

def hex_colors(source)
  hex_digit = "[0-9a-fA-f]"
  source.scan(/\#(\h{3,6})\b/).flatten
  # Why the fk do I have to flatten this?
end
