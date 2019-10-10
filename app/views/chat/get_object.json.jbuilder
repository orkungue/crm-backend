json.extract! @chat, :id, :send_from, :send_to, :text, :created_at, :updated_at
# hash = {}
# @customer.class.column_names.each do |x|
#   hash[x.to_sym] = @customer.send(x)
# end
# json.merge! hash
