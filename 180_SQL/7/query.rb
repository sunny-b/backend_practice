require 'sequel'

DB = Sequel.connect("postgres://localhost/sequel-single-table")

def format_money(number)
  format('%.2f', number.to_f)
end

dataset = DB[:menu_items]

dataset = dataset.select { [item,
                  menu_price,
                  ingredient_cost,
                  ((prep_time / 60.0) * 12.0).as(labor),
                  (menu_price - ingredient_cost - ((prep_time / 60.0) * 12.0)).as(profit)] }

dataset.each do |row|
  puts row[:item]
  puts "menu price: $#{format_money(row[:menu_price])}"
  puts "ingredient cost: $#{format_money(row[:ingredient_cost])}"
  puts "labor: $#{format_money(row[:labor])}"
  puts "profit: $#{format_money(row[:profit])}"
  puts
end

DB[:events].select {
  [ events__name.as(event),
    events__starts_at,
    sections__name.as(section),
    seats__row, seats__number.as(seat) ]
}.inner_join(:tickets, event_id: :events__id).inner_join(:seats, id: :tickets__seat_id).inner_join(:sections, id: :seats__section_id).inner_join(:customers, id: :tickets__customer_id).where(customers__email: 'gennaro.rath@mcdermott.co').all
