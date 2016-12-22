#! /usr/bin/env ruby

require 'pg'

class DatabaseTest
  def initialize
    create_database
    @db = PG.connect(dbname: 'billing2')
    create_tables
  end

  private

  def create_database
    system('dropdb', '--if-exists', 'billing2')
    system('createdb', 'billing2')
  end

  def create_tables
    customers_table
    fill_customer_table

    services_table
    fill_services_table

    create_join_table
    fill_join_table
  end

  def create_join_table
    @db.exec <<~MSG
      CREATE TABLE custoers_services (
        id SERIAL PRIMARY KEY,
        customer_id int NOT NULL REFERENCES customers(id) ON DELETE CASCADE,
        service_id int NOT NULL REFERENCES services(id)
      );
    MSG
  end

  def fill_join_table
    @db.exec <<~MSG
      INSERT INTO customers_services (customer_id, service_id)
      VALUES (1, 1), (1, 2), (1, 3),
      (3, 1), (3, 2), (3, 3), (3, 4), (3, 5),
      (4, 1), (4, 4),
      (5, 1), (5, 2), (5, 6),
      (6, 1), (6, 6), (6, 7);
    MSG
  end

  def fill_customer_table
    @db.exec <<~MSG
      INSERT INTO customers (name, payment_token)
      VALUES ('Pat Johnson', 'XHGOAHEQ'),
      ('Nancy Monreal', 'JKWQPJKL'),
      ('Lynn Blake', 'KLZXWEEE'),
      ('Chen Ke-Hua', 'KWETYCVX'),
      ('Scott Lasko', 'UUEAPQPS'),
      ('Jim Pornot', 'XKJEYAZA')
    MSG
  end

  def fill_services_table
    @db.exec <<~MSG
      INSERT INTO services (description, price)
      VALUES ('Unix Hosting', 5.95),
      ('DNS', 4.94),
      ('Whois Registration', 1.95),
      ('High Bandwidth', 15.00),
      ('Business Support', 250.00),
      ('Dedicated Hosting', 50.00),
      ('Bulk Email', 250.00),
      ('One-to-one Training', 999.00);
    MSG
  end

  def customers_table
    @db.exec <<~MSG
      CREATE TABLE customers (
        id SERIAL PRIMARY KEY,
        name text NOT NULL,
        payment_token char(8) NOT NULL UNIQUE CHECK(payment_token ~ '^[A-Z]{8}$')
      );
    MSG
  end

  def services_table
    @db.exec <<~MSG
      CREATE TABLE services (
        id SERIAL PRIMARY KEY,
        description text NOT NULL,
        price numeric(10, 2) NOT NULL CHECK(price >= 0.00)
      );
    MSG
  end
end
