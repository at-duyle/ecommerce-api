# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


20.times do |i|
  Admin.create(username: Faker::Internet.unique.user_name,
    password: '123456',
    email: Faker::Internet.unique.email,
    name: Faker::Name.name,
    gender: rand(0..2),
    role: rand(0..2),
    auth_token: rand(100000..999999),
    confirm_send_at: Time.now(),
    confirm_at: Time.now(),
    confirm_token: rand(100000..999999),
    reset_send_at: Time.now(),
    reset_token: rand(100000..999999),)
end
puts 'Admin'

50.times do |i|
  id = rand(0..2)
  email = Faker::Internet.email
  User.create!(username: Faker::Internet.unique.user_name,
    password: '123456',
    password_confirmation: '123456',
    name: Faker::Name.name,
    email: "#{email}",
    gender: id,
    city: '35-Đà Nẵng',
    district: '374-Quận Thanh Khê',
    ward: '10412-Phường Chính Gián',
    address: FFaker::AddressBR.street_address,
    description: FFaker::DizzleIpsum.phrases,
    auth_token: rand(100000..999999),
    confirm_send_at: Time.now(),
    confirm_at: Time.now(),
    confirm_token: rand(100000..999999),
    reset_send_at: Time.now(),
    reset_token: rand(100000..999999))
end

User.create!(username: 'duy.le',
  password: '123456',
  password_confirmation: '123456',
  name: 'Lê Ngọc Duy',
  email: 'ngocduy307@gmail.com',
  gender: 0,
  city: '35-Đà Nẵng',
  district: '374-Quận Thanh Khê',
  ward: '10412-Phường Chính Gián',
  address: '130 Điện Biên Phủ',
  description: FFaker::DizzleIpsum.phrases,
  auth_token: rand(100000..999999),
  confirm_send_at: Time.now(),
  confirm_at: Time.now(),
  confirm_token: rand(100000..999999),
  reset_send_at: Time.now(),
  reset_token: rand(100000..999999))
puts 'User'

# Category.create(name: 'điện gia dụng - điện lạnh')
# Category.create(name: 'Thời trang - Phụ kiện')
# Category.create(name: 'Tivi - Thiết bị nghe nhìn')
# Category.create(name: 'máy tính-laptop')
# Category.create(name: 'điện thoại')
# Category.create(name: 'Trẻ em & Đồ chơi')
# Category.create(name: 'Sức khỏe')
8.times do |i|
  Category.create(name: Faker::Commerce.unique.department)
end
puts 'Category'

# SubCategory.create(name: 'Đồ dùng nhà bếp', category_id: 1)
# SubCategory.create(name: 'Thiết bị gia đình', category_id: 1)
# SubCategory.create(name: 'Máy giặt', category_id: 1)
# SubCategory.create(name: 'Tủ lạnh', category_id: 1)
# SubCategory.create(name: 'Thời trang nữ', category_id: 2)
# SubCategory.create(name: 'Thời trang nam', category_id: 2)
# SubCategory.create(name: 'Phụ kiện', category_id: 2)
15.times do |i|
  SubCategory.create(name: Faker::Commerce.unique.department,
   category_id: Category.all.ids[rand(Category.count)])
end
puts 'SubCategory'

10.times do |i|
  Shop.create(
    name: FFaker::Company.name,
    address: FFaker::Address.street_address,
    phone_number: FFaker::PhoneNumber.phone_number,
    logo: Faker::Company.logo,
    latitude: 16.069815,
    longitude: 108.207000,
    admin_id: Admin.all.ids[rand(Admin.count)])
end
puts 'Shop'

category = ['Category', 'SubCategory']
200.times do |i|
  Product.create(
    name: Faker::Commerce.unique.product_name,
    producer: FFaker::Company.name,
    price: rand(10..50),
    description: FFaker::Lorem.paragraphs,
    quantity: rand(0..200),
    categorical_type: category[rand(0..1)],
    categorical_id: SubCategory.all.ids[rand(SubCategory.count)],
    shop_id: Shop.all.ids[rand(Shop.count)])
end
puts 'Product'

300.times do |i|
  Comment.create(
    user_id: User.all.ids[rand(User.count)],
    product_id: Product.all.ids[rand(Product.count)],
    content: FFaker::Lorem.sentences)
end
puts 'Comment'

150.times do |i|
  Image.create(
    url: Faker::Avatar.image("my-own-slug#{i}", "600x800", "png","set4"),
    product_id: Product.all.ids[rand(Product.count)])
end
puts 'Image'

100.times do |i|
  order = DeliveryOrder.create(
    total_price: rand(40..100),
    user_id: User.all.ids[rand(User.count)],
    city: '35-Đà Nẵng',
    district: '374-Quận Thanh Khê',
    ward: '10412-Phường Chính Gián',
    address: FFaker::AddressBR.street_address,
    phone: '01210321114')
  sum = 0
  5.times do |i|
    product_order = ProductsDeliveryOrder.create(
      product_id: Product.all.ids[rand(Product.count)],
      delivery_order_id: order.id,
      quantity: rand(5..50))
    sum += product_order.quantity * Product.find(product_order.product_id).price
  end
  puts 'ProductsDeliveryOrder'
end
order = DeliveryOrder.create(
  total_price: rand(40..100),
  user_id: 51,
  city: '35-Đà Nẵng',
  district: '374-Quận Thanh Khê',
  ward: '10412-Phường Chính Gián',
  address: FFaker::AddressBR.street_address,
  phone: '01210321114')
sum = 0
5.times do |i|
  product_order = ProductsDeliveryOrder.create(
    product_id: Product.all.ids[rand(Product.count)],
    delivery_order_id: order.id,
    quantity: rand(5..50))
  sum += product_order.quantity * Product.find(product_order.product_id).price
end
puts 'DeliveryOrder'

100.times do |i|
  PurchaseOrder.create(
    supplier: FFaker::Company.name)
end
puts 'PurchaseOrder'

200.times do |i|
  ProductsPurchaseOrder.create(
    product_id: Product.all.ids[rand(Product.count)],
    purchase_order_id: PurchaseOrder.all.ids[rand(PurchaseOrder.count)],
    quantity: rand(5..50))
end
puts 'ProductsPurchaseOrder'
