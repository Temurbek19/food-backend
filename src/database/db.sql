drop table users CASCADE;

create table users(
    user_id serial primary key,
    user_name varchar(64) not null,
    user_password varchar(64) not null,
    user_type varchar(32) not null
);

insert into users(user_name, user_password, user_type) values('Temurbek', '1996', 'admin');
insert into users(user_name, user_password, user_type) values('Ali', '1111', 'user');
insert into users(user_name, user_password, user_type) values('Guzal', '1997', 'user');

drop table foods CASCADE;

create table foods(
    food_id serial primary key,
    food_text varchar(256) not null,
    food_img varchar(256) not null,
    food_type varchar(32) not null,
    food_price varchar(32) not null,
    food_bowl int not null
);

insert into foods(food_text, food_img, food_type, food_price, food_bowl) values('Spicy seasoned seafood noodles', 'Image1.png', 'hotDishes', '2.29', 20);
insert into foods(food_text, food_img, food_type, food_price, food_bowl) values('Salted Pasta with mushroom sauce', 'Image2.png', 'coldDishes', '2.69', 11);
insert into foods(food_text, food_img, food_type, food_price, food_bowl) values('Beef dumpling in hot and sour soup', 'Image3.png', 'soup', '2.99', 16);
insert into foods(food_text, food_img, food_type, food_price, food_bowl) values('Healthy noodle with spinach leaf', 'Image4.png', 'grill', '3.29', 22);
insert into foods(food_text, food_img, food_type, food_price, food_bowl) values('Hot spicy fried rice with omelet', 'Image5.png', 'appetizer', '3.49', 13);
insert into foods(food_text, food_img, food_type, food_price, food_bowl) values('Spicy instant noodle with special omelette', 'Image6.png', 'dessert', '2.29', 17);
insert into foods(food_text, food_img, food_type, food_price, food_bowl) values('Spicy seasoned seafood noodles', 'Image1.png', 'coldDishes', '2.29', 20);
insert into foods(food_text, food_img, food_type, food_price, food_bowl) values('Salted Pasta with mushroom sauce', 'Image2.png', 'hotDishes', '2.69', 11);
insert into foods(food_text, food_img, food_type, food_price, food_bowl) values('Beef dumpling in hot and sour soup', 'Image3.png', 'grill', '2.99', 16);
insert into foods(food_text, food_img, food_type, food_price, food_bowl) values('Healthy noodle with spinach leaf', 'Image4.png', 'soup', '3.29', 22);
insert into foods(food_text, food_img, food_type, food_price, food_bowl) values('Hot spicy fried rice with omelet', 'Image5.png', 'dessert', '3.49', 13);
insert into foods(food_text, food_img, food_type, food_price, food_bowl) values('Spicy instant noodle with special omelette', 'Image6.png', 'appetizer', '2.29', 17);
insert into foods(food_text, food_img, food_type, food_price, food_bowl) values('Spicy seasoned seafood noodles', 'Image1.png', 'soup', '2.29', 20);
insert into foods(food_text, food_img, food_type, food_price, food_bowl) values('Salted Pasta with mushroom sauce', 'Image2.png', 'hotDishes', '2.69', 11);
insert into foods(food_text, food_img, food_type, food_price, food_bowl) values('Beef dumpling in hot and sour soup', 'Image3.png', 'appetizer', '2.99', 16);
insert into foods(food_text, food_img, food_type, food_price, food_bowl) values('Healthy noodle with spinach leaf', 'Image4.png', 'dessert', '3.29', 22);
insert into foods(food_text, food_img, food_type, food_price, food_bowl) values('Hot spicy fried rice with omelet', 'Image5.png', 'coldDishes', '3.49', 13);
insert into foods(food_text, food_img, food_type, food_price, food_bowl) values('Spicy instant noodle with special omelette', 'Image6.png', 'soup', '2.29', 17);
insert into foods(food_text, food_img, food_type, food_price, food_bowl) values('Spicy seasoned seafood noodles', 'Image1.png', 'dessert', '2.29', 20);
insert into foods(food_text, food_img, food_type, food_price, food_bowl) values('Salted Pasta with mushroom sauce', 'Image2.png', 'appetizer', '2.69', 11);
insert into foods(food_text, food_img, food_type, food_price, food_bowl) values('Beef dumpling in hot and sour soup', 'Image3.png', 'coldDishes', '2.99', 16);
insert into foods(food_text, food_img, food_type, food_price, food_bowl) values('Healthy noodle with spinach leaf', 'Image4.png', 'hotDishes', '3.29', 22);
insert into foods(food_text, food_img, food_type, food_price, food_bowl) values('Hot spicy fried rice with omelet', 'Image5.png', 'soup', '3.49', 13);
insert into foods(food_text, food_img, food_type, food_price, food_bowl) values('Spicy instant noodle with special omelette', 'Image6.png', 'grill', '2.29', 17);
insert into foods(food_text, food_img, food_type, food_price, food_bowl) values('Spicy seasoned seafood noodles', 'Image1.png', 'appetizer', '2.29', 20);
insert into foods(food_text, food_img, food_type, food_price, food_bowl) values('Salted Pasta with mushroom sauce', 'Image2.png', 'dessert', '2.69', 11);
insert into foods(food_text, food_img, food_type, food_price, food_bowl) values('Beef dumpling in hot and sour soup', 'Image3.png', 'grill', '2.99', 16);
insert into foods(food_text, food_img, food_type, food_price, food_bowl) values('Healthy noodle with spinach leaf', 'Image4.png', 'hotDishes', '3.29', 22);
insert into foods(food_text, food_img, food_type, food_price, food_bowl) values('Hot spicy fried rice with omelet', 'Image5.png', 'coldDishes', '3.49', 13);
insert into foods(food_text, food_img, food_type, food_price, food_bowl) values('Spicy instant noodle with special omelette', 'Image6.png', 'soup', '2.29', 17);

drop table orders CASCADE;

create table orders(
    order_id serial primary key,
    food_id int not null references foods(food_id),
    count int not null
);

insert into orders(food_id, count) values(2, 1);
insert into orders(food_id, count) values(3, 3);
insert into orders(food_id, count) values(12, 2);
insert into orders(food_id, count) values(24, 3);