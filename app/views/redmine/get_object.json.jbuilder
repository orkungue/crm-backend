json.extract! @issues
 #hash = {}
 #@customer.class.column_names.each do |x|
#   hash[x.to_sym] = @customer.send(x)
# end
# json.merge! **hash
