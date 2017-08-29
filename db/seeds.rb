# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


20.times do |i|
  Admin.create(username: FFaker::Internet.user_name,
              password: '123456',
              email: FFaker::Internet.email,
              name: FFaker::Name.name,
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
  email = FFaker::Internet.unique.email
  User.create(username: FFaker::Internet.unique.user_name,
              password: '123456',
              name: FFaker::Name.unique.name,
              email: "#{email}",
              gender: id,
              address: FFaker::AddressBR.full_address,
              description: FFaker::DizzleIpsum.phrases,
              auth_token: rand(100000..999999),
              confirm_send_at: Time.now(),
              confirm_at: Time.now(),
              confirm_token: rand(100000..999999),
              reset_send_at: Time.now(),
              reset_token: rand(100000..999999))
end

User.create(username: 'duy.le',
              password: '123456',
              name: 'Lê Ngọc Duy',
              email: 'ngocduy307@gmail.com',
              gender: 0,
              address: '193 Nguyễn Lương Bằng - Đà Nẵng',
              description: FFaker::DizzleIpsum.phrases,
              auth_token: rand(100000..999999),
              confirm_send_at: Time.now(),
              confirm_at: Time.now(),
              confirm_token: rand(100000..999999),
              reset_send_at: Time.now(),
              reset_token: rand(100000..999999))
puts 'User'

Category.create(name: 'điện gia dụng - điện lạnh')
Category.create(name: 'Thời trang - Phụ kiện')
Category.create(name: 'Tivi - Thiết bị nghe nhìn')
Category.create(name: 'máy tính-laptop')
Category.create(name: 'điện thoại')
Category.create(name: 'Trẻ em & Đồ chơi')
Category.create(name: 'Sức khỏe')
puts 'Category'

SubCategory.create(name: 'Đồ dùng nhà bếp', category_id: 1)
SubCategory.create(name: 'Thiết bị gia đình', category_id: 1)
SubCategory.create(name: 'Máy giặt', category_id: 1)
SubCategory.create(name: 'Tủ lạnh', category_id: 1)
SubCategory.create(name: 'Thời trang nữ', category_id: 2)
SubCategory.create(name: 'Thời trang nam', category_id: 2)
SubCategory.create(name: 'Phụ kiện', category_id: 2)
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
puts category[0]
puts category[1]
50.times do |i|
  Product.create(
    name: FFaker::Book.title,
    producer: FFaker::Company.name,
    price: 500000,
    description: FFaker::Book.description,
    quantity: rand(0..200),
    categorical_type: category[rand(0..1)],
    categorical_id: SubCategory.all.ids[rand(SubCategory.count)],
    shop_id: Shop.all.ids[rand(Shop.count)])
end
puts 'Product'

100.times do |i|
  Comment.create(
    user_id: User.all.ids[rand(User.count)],
    product_id: Product.all.ids[rand(Product.count)],
    content: "Good #{i}")
end
puts 'Comment'

100.times do |i|
  Image.create(
    url: 'http://www.insightvision.biz/sites/default/files/styles/product_thumb_220x280px/public/default_images/thumbnail-default.jpg?itok=71fjNhNx',
    product_id: Product.all.ids[rand(Product.count)])
end
puts 'Image'

70.times do |i|
  DeliveryOrder.create(
    user_id: User.all.ids[rand(User.count)])
end
puts 'DeliveryOrder'

70.times do |i|
  ProductsDeliveryOrder.create(
    product_id: Product.all.ids[rand(Product.count)],
    delivery_order_id: DeliveryOrder.all.ids[rand(DeliveryOrder.count)],
    quantity: rand(5..50))
end
puts 'ProductsDeliveryOrder'

70.times do |i|
  PurchaseOrder.create(
    supplier: FFaker::Company.name)
end
puts 'PurchaseOrder'

70.times do |i|
  ProductsPurchaseOrder.create(
    product_id: Product.all.ids[rand(Product.count)],
    purchase_order_id: PurchaseOrder.all.ids[rand(PurchaseOrder.count)],
    quantity: rand(5..50))
end
puts 'ProductsPurchaseOrder'
