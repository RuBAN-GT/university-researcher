defaults = [
  { :slug => 'admin' },
  { :slug => 'user' }
]

defaults.each do |role|
  Role.new(role).save rescue nil
end

p 'Roles was created'
