

Role.delete_all
Store.delete_all

role  = Role.create(name: 'admin')
store = Store.create(name: 'Main Branch')
puts "#{role.id}"
puts "#{store.id}"
if role && store
	User.delete_all
    User.create([{ name: 'lalit', email: 'netapp@gmail.com', password: "11111111", remember_created_at: nil, role_id: role.id, store_id: store.id }])
end

