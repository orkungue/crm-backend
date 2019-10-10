json.extract! @customer, :uuid, :name, :employees, :comment, :address, :customer_grade_id, :is_broke, :turnover_pa
 #hash = {}
 #@customer.class.column_names.each do |x|
#   hash[x.to_sym] = @customer.send(x)
# end
# json.merge! **hash
