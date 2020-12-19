def male_first_names
  %w[Андрей Сергей Михаил Василий Денис Николай Виктор Дмитрий Владимир Олег].sample
end

def male_middle_names
  %w[Андреевич Сергеевич Михаилович Васильевич Денисович Николаевич Олегович].sample
end

def male_last_names
  %w[Уваров Глызов Васильев Кириллов Зайцев Волков Скворцов Онегин Малышев Осипов].sample
end

11.times do
  random_signal = (6..16).map { ('a'..'z').to_a[rand(26)] }.join.upcase

  Student.find_or_create_by(first_name: male_first_names,
                 middle_name: male_middle_names,
                 last_name: male_last_names,
                 gender: 0,
                 signal: random_signal)
end

def female_first_names
  %w[Анфиса Лариса Ольга Мария Лидия Валерия Анна Марина Екатерина].sample
end

def female_middle_names
  %w[Сергеевна Олеговна Алексеевна Александровна Вячеславовна Ульяновна].sample
end

def female_last_names
  %w[Репина Хромова Боярская Аксенова Багрова Костикова Пирогова Мастерова].sample
end

12.times do
  Student.find_or_create_by(first_name: female_first_names,
                 middle_name: female_middle_names,
                 last_name: female_last_names,
                 gender: 1)
end

puts 'Seeds OK!'
