names = %w(Taro Jiro Hana John Mike Sophy Bill Alex Mary )
0.upto(9) do |idx|
  User.create(
    name: names[idx],
    email: "#{names[idx]}@example.com",
    password: "bookers",
    password_confirmation: "bookers"
  )
end

