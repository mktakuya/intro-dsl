setup do
  puts "--- set height and weight ---"
  @height = 168
  @weight = 58
end

setup do
  puts "--- set bmi ---"
  @bmi = @weight.to_f / (@height.to_f / 100) * 2
end

profile 'height is low' do
  @height < 160
end

profile 'height is high' do
  180 <= @height
end

profile 'weight is light' do
  @weight < 50
end

profile 'weight is normal' do
  50 <= @weight && @weight < 70
end

profile 'weight is heavy' do
  70 <= @weight
end

profile 'bmi is low' do
  @bmi < 18.5
end

profile 'bmi is normal' do
  18.5 <= @bmi && @bmi < 25
end

profile 'bmi is high' do
  25 <= @bmi
end

