hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

a = hsh.map do |_, details|
  if details[:type] == 'fruit'
    details[:colors].map do |colors|
      colors.capitalize
    end
  elsif details[:type] == 'vegetable'
    details[:size].upcase
  end
end

p a
