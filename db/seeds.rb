# Admin user
User.create_with(name: 'Admin User', password: 'sample').find_or_create_by!(email: 'admin@railssample.com')
