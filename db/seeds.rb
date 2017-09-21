# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

images =[
    "image/upload/v1505908173/acjrxjgswsazata03d5h.png",
    "image/upload/v1505908168/uan9i2ljwxmljc6fi85z.png",
    "image/upload/v1505908162/pgpyfsoy4vvaiskqdt5f.png",
    "image/upload/v1505908157/j3azz686roeufq7rleis.png",
    "image/upload/v1505908152/iwnte6lvtrh93pt0kdsb.png",
    "image/upload/v1505908148/ubosfmip9ntllarau8jj.png",
    "image/upload/v1505908142/eitfvzsglbto0xnawhhf.png",
    "image/upload/v1505908138/qmw8ncltud16mlkz57dr.png",
    "image/upload/v1505908133/qdzze1nlnq3hzv8sfcip.png",
    "image/upload/v1505908129/msvgh4j2ggiknab3o1ga.png",
    "image/upload/v1505908125/i3igdbmng0dpifxh0wjb.png",
    "image/upload/v1505908120/taf8ijl9kdrxaaitivrf.png",
    "image/upload/v1505908116/yy37gw5hvfpdcyjjakvw.png",
    "image/upload/v1505908111/jz3optyrqowo9ylv3zfi.png",
    "image/upload/v1505908106/yyyqqrmrh1bszk0duwwl.png",
    "image/upload/v1505908101/r03esjlxwgcocvfpyqsd.png",
    "image/upload/v1505908094/q43nsa6erlp7sym2j4dz.png",
    "image/upload/v1505908085/xcukno93z0ogrkshoypk.png",
    "image/upload/v1505908080/x1yogjdnqqlpdfzft4xs.png",
    "image/upload/v1505908074/ecx8oobrablr28ltn1xn.png",
    "image/upload/v1505908068/sfsowcssisv4pizfdxuh.png",
    "image/upload/v1505908063/xh0g6fttcafwsalba1qp.png",
    "image/upload/v1505908057/jifcna44ktrjsltuovpn.png",
    "image/upload/v1505908050/ejn1mmhkdzyb9yiikwzo.png",
    "image/upload/v1505908045/ur0ycy4gvcnqjah0fxnk.png",
    "image/upload/v1505908041/fc67gmkj0vd74dpqxgnk.png",
    "image/upload/v1505908036/ucke1gntdlkxzmxpzox3.png",
    "image/upload/v1505908032/yvgidu0qqohp6ftpvpvr.png",
    "image/upload/v1505908027/p1cpzimnqlwpwdlm7jkq.png",
    "image/upload/v1505908022/d9icptgtxskiptkflq1m.png",
    "image/upload/v1505908017/dtcjxmk6w4h5hhok13qi.png",
    "image/upload/v1505908012/c0zrcginl3xtldd9wao6.png",
    "image/upload/v1505908007/e0w3xyhbfxglgh5qxnhl.png",
    "image/upload/v1505908002/a1z4vctf5zzq52d0klvk.png",
    "image/upload/v1505907997/b4iueimyqmiytnz0hn2g.png",
    "image/upload/v1505907989/qkqrqco7up9vb1r16dt9.png",
    "image/upload/v1505907980/vf8ruakmxwiyv4ok0gwq.png",
    "image/upload/v1505907966/qwtdg7jqylxjjeewpdyw.png",
    "image/upload/v1505907957/m7lqhjqecpmhkpb7nlpt.png",
    "image/upload/v1505907953/t8ikrqmurrnavm5juyrj.png",
    "image/upload/v1505907947/taudyfoqyy2dzrugjxmk.png",
    "image/upload/v1505907942/jfdhxoc5wokoepu2yx8o.png",
    "image/upload/v1505907937/dhtqduhwgtslqcacft2c.png",
    "image/upload/v1505907933/ijh03rcmvesuxwpsjubj.png",
    "image/upload/v1505907928/p8ipzgm9znuxqnsxi7uz.png",
    "image/upload/v1505907923/itmf4gvii7y3bfscogif.png",
    "image/upload/v1505907917/jkojbhs49y0sj9skdlm9.png",
    "image/upload/v1505907912/hrkizwpvxoualxswlhet.png",
    "image/upload/v1505907908/qfyof6gcyfw0cobumsy4.png",
    "image/upload/v1505907902/txfta57hxvmgaglubrxd.png",
    "image/upload/v1505907898/efwx2ba7efmvdcmirwwl.png"
]

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

300.times do |i|
  Image.create(
    url: images[i % 51],
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
  name: Faker::Name.name,
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
