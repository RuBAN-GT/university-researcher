after :roles do
  defaults = [
    {
      :email => 'dkruban@gmail.com',
      :realname => 'Дмитрий Рубан',
      :password => 'Qwerty',
      :password_confirmation => "Qwerty",
      :roles => [Role.find_by_slug('admin')]
    },
    {
      :email => 'kan@vsu.ru',
      :realname => 'Кураков Алексей',
      :password => 'Qwerty',
      :password_confirmation => 'Qwerty',
      :roles => [Role.find_by_slug('admin')]
    }
  ]

  defaults.each do |user|
    next unless User.find_by_email(user[:email]).nil?

    u = User.new(user)

    u.skip_confirmation! if u.respond_to? :skip_confirmation!

    u.save!
  end

  p 'Admin was created'
end
