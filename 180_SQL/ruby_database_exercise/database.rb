require 'pg'
require 'sequel'

def create_database
  system("dropdb", "--if-exists", "billing2")
  system("createdb", "billing2")
end

def create_customers_table
  DB.create_table :customers do
    primary_key :id
    String :name, :null => false, text: true
    String :payment_token, fixed: true, :null => false, size: 8, unique: true

    constraint(:payment_token_check) do
      payment_token =~ /\A[A-Z]{8}/
    end
  end
end

def create_services_table
  DB.create_table :services do
    primary_key :id
    String :description, text: true
    BigDecimal :price, size: [10, 2], null: false
    constraint(:services_price_greater_than_zero) { price >= 0.00 }
  end
end

def create_join_table
  DB.create_table(:customers_services) do
    primary_key :id
    foreign_key :customer_id, :customers, null: false, on_delete: :cascade
    foreign_key :service_id, :services, null: false
  end
end

def insert_join_table_row(customer_id, service_id)
  DB[:customers_services].insert(customer_id: customer_id, service_id: service_id)
end

def fill_join_table
  insert_join_table_row(1, 1)
  insert_join_table_row(1, 2)
  insert_join_table_row(1, 3)

  insert_join_table_row(3, 1)
  insert_join_table_row(3, 2)
  insert_join_table_row(3, 3)
  insert_join_table_row(3, 4)
  insert_join_table_row(3, 5)

  insert_join_table_row(4, 1)
  insert_join_table_row(4, 4)

  insert_join_table_row(5, 1)
  insert_join_table_row(5, 2)
  insert_join_table_row(5, 6)

  insert_join_table_row(6, 1)
  insert_join_table_row(6, 6)
  insert_join_table_row(6, 7)
end

def fill_customers
  DB[:customers].insert(name: 'Pat Johnson', payment_token: 'XHGOAHEQ')
  DB[:customers].insert(name: 'Nancy Monreal', payment_token: 'JKWQPJKL')
  DB[:customers].insert(name: 'Lynn Blake', payment_token: 'KLZXWEEE')
  DB[:customers].insert(name: 'Chen Ke-Hua', payment_token: 'KWETYCVX')
  DB[:customers].insert(name: 'Scott Lakso', payment_token: 'UUEAPQPS')
  DB[:customers].insert(name: 'Jim Pornot', payment_token: 'XKJEYAZA')
end

def insert_service_row(description, price)
  DB[:services].insert(description: description, price: price)
end

def fill_services
  insert_service_row('Unix Hosting', 5.95)
  insert_service_row('DNS', 4.95)
  insert_service_row('Whois Registration', 1.95)
  insert_service_row('High Bandwidth', 15.00)
  insert_service_row('Business Support', 250.00)
  insert_service_row('Dedicated Hosting', 50.00)
  insert_service_row('Bulk Email', 250.00)
  insert_service_row('One-to-one Training', 999.00)
end

DB = Sequel.connect("postgres://localhost/billing2")

create_database

create_customers_table
fill_customers

create_services_table
fill_services

create_join_table
fill_join_table

# -------------------

dataset = DB[:customers]
dataset.select(:customers__id, :name, :payment_token)
       .distinct
       .join(:customers_services, customer_id: :customers__id)
       .each { |row| puts row[:row] }
