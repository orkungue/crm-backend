json.extract! @activities, :id, :object_id, :object_controller_name, :headline, :owner_id, :customer_id
# hash = {}
# @customer.class.column_names.each do |x|
#   hash[x.to_sym] = @customer.send(x)
# end
# json.merge! hash
