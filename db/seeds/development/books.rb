User.all.each do |user|
  0.upto(4) do |idx|
    user.books.create!(
      title: "test#{idx}",
      body: "test#{idx}",
    )
  end
end
