drop table restaurant cascade constraints;
create table restaurant (
 rid   number(2) not null,
 name  varchar2(50) not null,
 phone varchar2(12),
 street_name varchar2(13) not null,
 street_num number(4) not null,
 sigdish varchar2(60),
 primary key (rid)
);

drop table promotion cascade constraints;
create table promotion (
 pid number(3),
 start_date date,
 end_date date,
 description varchar2(75) not null,
 rid   number(2) not null,
 primary key (pid),
 foreign key (rid) references restaurant
);


drop table food cascade constraints;
create table food (
 name varchar2(60),
 calorie number(4),
 type varchar2(15) not null,
 primary key (name));

drop table employee cascade constraints;
create table employee (
 eid number,
 position varchar2(20) not null,
 num_times_eom number(2),
 fname varchar2(13) not null,
 lname varchar2(15) not null,
 minit varchar(1),
 rid   number(2) not null,
 primary key (eid),
 foreign key (rid) references restaurant);

drop table ratings cascade constraints;
create table ratings (
 avg_price varchar2(7),
 cus_sat number(1),
 sanitation number(1),
 quality number(1),
 rid   number(2) not null,
 foreign key (rid) references restaurant);

drop table sells cascade constraints;
create table sells (
 name varchar2(60) not null,
 rid number(2) not null,
 primary key (name),
 foreign key (rid) references restaurant,
 foreign key (name) references food);
 
 
insert into restaurant values(01,'Big Mammas 
Burritos','740-566-4100','S. Court St',10,'Chipotle Ranch Mamma');

insert into restaurant values(02,'Pita Pit','740-593-8600','N. Court 
St',8,'Chicken Caeser Pita on Wheat');

insert into restaurant(rid,name,phone,street_name,street_num) values(03,'Souvlakis 
Mediterranean','740-592-4131','W. State St',9);

insert into restaurant values(04,'Insomnia Cookies','877-632-6654','N. 
Court St',27,'Chocolate Chunk Cookies');

insert into restaurant values(05,'Wendys','740-592-5200','S. Court 
St',40,'Baconator');

insert into restaurant(rid,name,phone,street_name,street_num) values(06,'Chipotle','740-592-3656','S. Court St', 
41);

insert into restaurant values(07,'Habibis American and 
Mediterranean Cuisine','740-249-4055','S. Court St',19,'Baba Ghanoush');

insert into restaurant values(08,'OBettys Red Hot','740-589-6111','W. 
State St', 15, 'The Dixie');

insert into restaurant values(09,'Courtside Pizza','740-594-9999','N. 
Court St', 85, 'Four-Squared Pizza');

insert into restaurant values(10,'Papa Johns','740-594-7272','E. State 
St', 443, 'Hamburger Pizza');

insert into restaurant (rid,name,phone,street_name,street_num) values(11, 'China King', '740-592-1128','S. Court 
St', 21);

insert into restaurant(rid,name,phone,street_name,street_num) values(12, 'Peking Express','740-594-2777','N. 
Court St',5);

insert into restaurant(rid,name,phone,street_name,street_num) values(13, 'China Panda', '740-593-8883', 'E. 
State St', 965);

insert into restaurant values(14, 'Millers Chicken','740-593-6544', 'W. 
State St', 235, 'Chicken Sandwich');

insert into restaurant values(15, 'Avalanche Pizza','740-594-4664', 'E. 
State St', 449, 'The Avalanche Ranch');

insert into restaurant values(16, 'Dominos', '740-593-3395', 'Mill 
St',12,'Wisconsin Six Cheese Pizza');

insert into restaurant values(17, 'Pizza Hut', '740-593-3697', 'E. State 
St', 903, '5 Meat Pizza');

insert into restaurant values(18, 'Donatoes', '740-592-5049', 'E. State 
St', 688, 'No Crust Bowl Pizza');

insert into restaurant values(19, 'Subway','740-592-6030', 'N. Court 
St',25, 'Flatizza');

insert into restaurant(rid,name,phone,street_name,street_num) values(20,'Quiznos','740-594-7042', 'S. Court St', 
42);

insert into restaurant values(21,'Wings Over Athens','740-593-6699','N. 
Court St', 33, 'Aircraft Carrier');

insert into restaurant values(22,'D.P Dough', '740-594-8585','Richland 
Ave', 374, 'Bear Zone');

insert into restaurant values(23, 'McDonalds', '740-592-1656', 'Richland 
Ave', 399, 'Big Mac');

insert into restaurant values(24, 'Burger King','740-594-5500','E. State 
St',949, 'Whooper');

insert into restaurant values(25, 'Taco Bell','740-592-2266','E. State 
St', 978, 'Waffle Taco');

insert into restaurant(rid,name,phone,street_name,street_num) values(26, 'Leghorns','740-566-1009','E. State 
St', 994);

insert into restaurant values(27, 'Texas Roadhouse','740-589-7427','E. 
State St',996, 'Baked Rolls');

insert into restaurant values(28,'Kisers Barbeque', '740-594-7427', 'E. 
State St',1002, 'Beef Brisket');

insert into restaurant values(29,'The Pub','740-592-2699','N. Court 
St',39, 'Sloppy Ben');

insert into restaurant values(30,'The Pigskin', '740-594-5002', 'N. Court 
St', 38, 'BBQ Pulled Pork Sandwich');

insert into restaurant values(31,'Fusion Noodle 
Company','740-589-5511','W. Union St', 30, 'Pesto Farfalle');

insert into restaurant(rid,name,phone,street_name,street_num) values(32, 'Union Street Diner', '740-594-6007', 
'W. Union St', 70);

insert into restaurant(rid,name,phone,street_name,street_num) values(33, 'W.G. Grinders', '740-594-6555', 'W. 
Union St',120);

insert into restaurant values(34, 'Mikes Dog Shack', '740-594-7777', 'S. 
Court St',20,'Mike Dog');

insert into restaurant values(35,'Larrys Dawg House', '740-592-3819', 'W. 
Union St', 410, 'Foot Long Hot Dog');

insert into restaurant(rid,name,phone,street_name,street_num) values(36,'Whits Frozen Custard', 
'740-594-7375','S. Court St',49);

insert into restaurant values(37,'Bagel Street Deli','740-593-3838','S. 
Court St', 27, 'Ray Pruitt');

insert into restaurant values(38, 'Uptown Grill','740-331-1970', 'W. 
Union St',11, 'Chicken and Waffle');


insert into promotion(pid,start_date,description,rid) values(000, 
'14-NOV-13', 'Eat a three pound burrito and get it for free', 01);

insert into promotion values(001, '31-MAR-14','04-APR-14','Three free 
chocolate chunk cookies with all online orders', 02);

insert into promotion values(002, '01-MAR-14', '31-MAR-14','$1 off any 
premium sandwich with email sign up',05);

insert into promotion(pid,description,rid) values(003,'Enter the code VISA25 at 
checkout for 25% off regular price items',10);

insert into promotion(pid,description,rid) values(004,'2 Large 1-Topping pizzas for 
$15.99',15);

insert into promotion(pid,description,rid) values(005, 'Get 8 bone-out wings for 
just $5',17);

insert into promotion(pid,description,rid) values(006, 'Featured footlong of the 
month', 19);

insert into promotion(pid,end_date,description,rid) 
values(007,'04-APR-14', '$1 off any regular or large sub',20);

insert into promotion(pid,description,rid) values(008,'2 for $5 mix and match 
deal',24);

insert into promotion(pid,description,rid) values(009,'Come in Tuesdays for $5.99 
burgers and free pool',30);

insert into promotion(pid,description,rid) values(010,'Come in every Wednesday for 
$0.99 regular hot dogs and corn dogs',35);

insert into food values('Ultimamma', 762, 'Entree');
insert into food values('Veggie Mamma',330, 'Entree');
insert into food values('Loaded Nachos',250,'Appitizer');
insert into food values('Dagwood', 334 , 'Entree');
insert into food values('Philly Steak', 543, 'Entree');
insert into food values('Steak n Eggs',433, 'Breakfast');
insert into food values('Seasoned Fries', 232, 'Side');
insert into food values('Chicken Gyro', 444, 'Entree');
insert into food values('Lamb Gyro', 433, 'Entree');
insert into food values('Sugar Cookie', 200, 'Desert');
insert into food values('Triple Chocolate Chunk Cookie', 256, 'Desert');
insert into food values('Peanut Butter Cookie', 233, 'Desert');
insert into food values('1/2 lb Double', 820, 'Entree');
insert into food values('Caesar Side Salad', 250, 'Appitizer');
insert into food values('Large Chocolate Frosty', 580, 'Desert');
insert into food values('Chips and Guac', 223, 'Side');
insert into food values('Chicken Burrito', 560, 'Entree');
insert into food values('Steak Burrito', 620, 'Entree');
insert into food values('Falafel Sandwich', 354, 'Entree');
insert into food values('Greek Spinach Pie',322,'Entree');
insert into food values('Kafta Kabob', 333, 'Entree');
insert into food values('Gypsy', 278, 'Entree');
insert into food values('Syra', 300, 'Entree');
insert into food values('Chili Cheese Fries', 350, 'Side');
insert into food values('BLT', 433, 'Entree');
insert into food values('BBQ Chicken Pizza', 278, 'Entree');
insert into food values('Supreme', 250, 'Entree');
insert into food values('Johns Favorite',270, 'Entree');
insert into food values('The Works', 210, 'Entree');
insert into food values('The Meats' ,240, 'Entree');
insert into food values('Crab Rangoon', 123, 'Appitizer');
insert into food values('General Tsos', 333, 'Entree');
insert into food values('Hot and Spicy Chicken', 264, 'Entree');
insert into food values('Sesame Chicken', 300, 'Entree');
insert into food values('Egg Roll', 143, 'Side');
insert into food values('Egg Drop Soup', 150, 'Appitizer');
insert into food values('Chicken Sandwich', 432, 'Entree');
insert into food values('French Fries', 254 , 'Side');
insert into food values('Cole Slaw', 178, 'Side');
insert into food values('The Wheels on Fire', 289, 'Entree');
insert into food values('The Skeletonwitch', 213, 'Entree');
insert into food values('The Nuge', 299, 'Entree');
insert into food values('Pacific Veggie', 290,'Entree');
insert into food values('MeatZZa', 310, 'Entree');
insert into food values('Bacon Cheeseburger Pizza', 300, 'Entree');
insert into food values('Garlic Parmesan Pizza', 230, 'Entree');
insert into food values('3 Cheese Stuffed Crust', 360, 'Entree');
insert into food values('Veggie Lovers', 230, 'Entree');
insert into food values('Serious Cheese', 330, 'Entree');
insert into food values('Classic Trio', 330, 'Entree');
insert into food values('Vegy', 230, 'Entree');
insert into food values('6" Cold Cut Combo',440,'Entree');
insert into food values('6" Pizza Sub', 450, 'Entree');
insert into food values('6" Tuna', 234, 'Entree');
insert into food values('Sm Prime Rib Cheesesteak Sub', 680, 'Entree');
insert into food values('Sm Black Angus Sub', 520, 'Entree');
insert into food values('Sm Turkey Ranch and Swiss Sub', 340, 'Entree');
insert into food values('1/2 lb of boneless wings', 640, 'Entree');
insert into food values('Waffle Fries', 243, 'Side');
insert into food values('Buffer Zone',415, 'Entree');
insert into food values('Cheese Zone', 439, 'Entree');
insert into food values('End Zone', 359, 'Entree');
insert into food values('Big Mac', 550, 'Entree');
insert into food values('BBQ Ranch Burger', 350, 'Entree');
insert into food values('Oreo McFlurry', 510, 'Desert');
insert into food values('Whopper', 630, 'Entree');
insert into food values('Apple Slices', 30, 'Side');
insert into food values('Sm Strawberry Milk Shake', 500, 'Desert');
insert into food values('Sausage Waffle Taco', 370, 'Breakfast');
insert into food values('Sausage Flatbread Melt', 300, 'Breakfast');
insert into food values('Hash Brown', 160, 'Breakfast');
insert into food values('Sour Cream Fries', 200, 'Appitizer');
insert into food values('Buffalo Shrimp', 322, 'Appitizer');
insert into food values('Turkey Burger', 543, 'Entree');
insert into food values('10 oz Ribeye', 364, 'Entree');
insert into food values('Sirloin Kabob', 190, 'Entree');
insert into food values('Chicken Critter', 400, 'Entree');
insert into food values('Traditional Chopped Pork', 334, 'Entree');
insert into food values('Beer Bratwurst', 321, 'Entree');
insert into food values('North Carolina Pork', 334, 'Entree');
insert into food values('Spinach Chopped Salad', 245, 'Appitizer');
insert into food values('Pub Sliders', 456, 'Appitizer');
insert into food values('Sloppy Ben', 655, 'Entree');
insert into food values('Buffalo Chips', 255, 'Appitizer');
insert into food values('Hot Wings' , 444, 'Entree');
insert into food values('Clam Strips', 322, 'Appitizer');
insert into food values('Pesto Farfalle', 433, 'Entree');
insert into food values('2 Spring Rolls', 234, 'Appitizer');
insert into food values('Pho', 433, 'Entree');
insert into food values('Tilapia Fillet', 333, 'Entree');
insert into food values('Country Omelettes', 544, 'Breakfast');
insert into food values('Breakfast Croissant', 433,'Breakfast');
insert into food values('6" Beef Reuben Grinder', 220, 'Entree');
insert into food values('6" Spicy Chicken Grinder', 400, 'Entree');
insert into food values('6" Meatball Grinder', 720, 'Entree');
insert into food values('Mike Dog', 345, 'Entree');
insert into food values('Taco in a Bag', 310, 'Entree');
insert into food values('Potato Chips', 200, 'Side');
insert into food values('Foot Long Hot Dog', 300, 'Entree');
insert into food values('Corn Dog', 256, 'Entree');
insert into food values('Single Hamburger', 433, 'Entree');
insert into food values('Almond Joy Ice Cream', 355, 'Desert');
insert into food values('Espresso Chip Ice Cream', 299, 'Desert');
insert into food values('Buckeye Ice Cream', 411, 'Desert');
insert into food values('Ray Pruitt', 489, 'Breakfast');
insert into food values('Abe Froman', 510, 'Breakfast');
insert into food values('True Blue', 399, 'Breakfast');
insert into food values('Bacon Ranch Chicken Sandwich', 455, 'Entree');
insert into food values('Cheese Fries', 333, 'Side');
insert into food values('Chicken and Waffle', 655, 'Entree');

insert into employee 
values(00001,'Cashier',1,'Makayla','Westerfeld','T',01);
insert into employee values(00002,'Janitor',2,'Sam', 'Lucas', 'R',02);
insert into employee values(00003,'Cashier',0,'Mike','Rodgers','L', 
03);
insert into employee values(00004,'Cook',1,'Dexter','Morgan','G',04);
insert into employee values(00005,'Cook',5,'Debra', 'Morgan','E',05);
insert into employee values(00006,'Cashier',0,'Sam','Romeo','L',06);
insert into employee values(00007,'Cashier',1,'Mike','Thompson','H',07);
insert into employee values(00008,'Janitor',3,'Mike','Dyer','T',08);
insert into employee values(00009,'Cook',2,'Steven','Rodgers','L',09);
insert into employee values(00010,'Cashier',2,'Janet', 'Smith','D',10);
insert into employee values(00011,'Waitress',1,'Annie', 'Shen','L',11);
insert into employee values(00012,'Server',4,'Jamie', 'Lee','F',12);
insert into employee values(00013,'Hostess',1,'Bruce', 'Lee','F',13);
insert into employee values(00014,'Cashier',0,'George', 'Bush','W',14);
insert into employee values(00015,'Cook',1,'Barack','Obama','H',15);
insert into employee values(00016,'Janitor',0,'Mitt','Romney','L',16);
insert into employee values(00017,'Delivery Driver',8,'Miley','Cyrus','K',17);
insert into employee values(00018,'Cook',1,'Bill','Russell','Q',18);
insert into employee values(00019,'Cashier',0,'Bill','Gates','R',19);
insert into employee values(00020,'Cashier',4,'Pat','Grace','L',20);
insert into employee values(00021,'Cashier',0,'Ricky','Bobby','F',21);
insert into employee values(00022,'Delivery 
Driver',2,'Grace','Turcu','T',22);
insert into employee values(00023,'Cook',2,'Mike','Jones','G',23);
insert into employee values(00024,'Cook',1,'Dwayne','Johnson','L',24);
insert into employee values(00025,'Cashier',0,'Rick','James','P',25);
insert into employee 
values(00026,'Hostess',0,'Jessica','Williams','C',26);
insert into employee values(00027,'Hostess',1,'Carly','Matthews','D',27);
insert into employee values(00028,'Cashier',2,'Brooke','Livia','D',28);
insert into employee values(00029,'Cashier',1,'Trey','Palmer','A',29);
insert into employee values(00030,'Bartender',0,'Mike','Jackson','T',30);
insert into employee values(00031,'Cashier',1,'Tara','Knowles','A',31);
insert into employee 
values(00032,'Hostess',0,'Allison','Goodwin','M',32);
insert into employee values(00033,'Delivery 
Driver',0,'Aaron','Carter','G',33);
insert into employee values(00034,'Cashier',1,'Jake','Green','D',34);
insert into employee values(00035,'Cook',0,'Colin','Hinton','E',35);
insert into employee 
values(00036,'Cashier',1,'Ronald','McDonald','R',36);
insert into employee values(00037,'Server',4,'Devon','Shanks','K',37);
insert into employee values(00038,'Server',1,'Drew','Smith','G',38);

insert into sells values('Ultimamma',01);
insert into sells values('Veggie Mamma',01);
insert into sells values('Loaded Nachos',01);
insert into sells values('Dagwood',02);
insert into sells values('Philly Steak',02);
insert into sells values('Steak n Eggs',02);
insert into sells values('Chicken Gyro',03);
insert into sells values('Lamb Gyro',03);
insert into sells values('Sugar Cookie',04);
insert into sells values('Triple Chocolate Chunk Cookie',04);
insert into sells values('Peanut Butter Cookie',04);
insert into sells values('1/2 lb Double',05);
insert into sells values('Caesar Side Salad',05);
insert into sells values('Large Chocolate Frosty',05);
insert into sells values('Chips and Guac',06);
insert into sells values('Chicken Burrito',06);
insert into sells values('Steak Burrito',06);
insert into sells values('Falafel Sandwich',07);
insert into sells values('Greek Spinach Pie',07);
insert into sells values('Kafta Kabob',07);
insert into sells values('Gypsy',08);
insert into sells values('Syra',08);
insert into sells values('Chili Cheese Fries',08);
insert into sells values('BLT',09);
insert into sells values('BBQ Chicken Pizza',09);
insert into sells values('Supreme',09);
insert into sells values('Johns Favorite',10);
insert into sells values('The Works',10);
insert into sells values('The Meats',10);
insert into sells values('Crab Rangoon',11);
insert into sells values('General Tsos',11);
insert into sells values('Hot and Spicy Chicken',11);
insert into sells values('Sesame Chicken',12);
insert into sells values('Egg Roll',12);
insert into sells values('Egg Drop Soup',13);
insert into sells values('Chicken Sandwich',14);
insert into sells values('French Fries',14);
insert into sells values('Cole Slaw',14);
insert into sells values('The Wheels on Fire',15);
insert into sells values('The Skeletonwitch',15);
insert into sells values('The Nuge',15);
insert into sells values('Pacific Veggie',16);
insert into sells values('MeatZZa',16);
insert into sells values('Bacon Cheeseburger Pizza',16);
insert into sells values('Garlic Parmesan Pizza',17);
insert into sells values('3 Cheese Stuffed Crust',17);
insert into sells values('Veggie Lovers',17);
insert into sells values('Serious Cheese',18);
insert into sells values('Classic Trio',18);
insert into sells values('Vegy',18);
insert into sells values('6" Cold Cut Combo',19);
insert into sells values('6" Pizza Sub',19);
insert into sells values('6" Tuna',19);
insert into sells values('Sm Prime Rib Cheesesteak Sub',20);
insert into sells values('Sm Black Angus Sub',20);
insert into sells values('Sm Turkey Ranch and Swiss Sub',20);
insert into sells values('1/2 lb of boneless wings',21);
insert into sells values('Waffle Fries', 21);
insert into sells values('Buffer Zone',22);
insert into sells values('Cheese Zone',22);
insert into sells values('End Zone',22);
insert into sells values('Big Mac',23);
insert into sells values('BBQ Ranch Burger',23);
insert into sells values('Oreo McFlurry',23);
insert into sells values('Whopper',24);
insert into sells values('Apple Slices',24);
insert into sells values('Sm Strawberry Milk Shake',24);
insert into sells values('Sausage Waffle Taco',25);
insert into sells values('Sausage Flatbread Melt',25);
insert into sells values('Hash Brown',25);
insert into sells values('Sour Cream Fries',26);
insert into sells values('Buffalo Shrimp',26);
insert into sells values('Turkey Burger',26);
insert into sells values('10 oz Ribeye',27);
insert into sells values('Sirloin Kabob',27);
insert into sells values('Chicken Critter',27);
insert into sells values('Traditional Chopped Pork',28);
insert into sells values('Beer Bratwurst',28);
insert into sells values('North Carolina Pork',29);
insert into sells values('Spinach Chopped Salad',29);
insert into sells values('Pub Sliders',29);
insert into sells values('Sloppy Ben',29);
insert into sells values('Buffalo Chips',30);
insert into sells values('Hot Wings',30);
insert into sells values('Clam Strips',30);
insert into sells values('Pesto Farfalle',31);
insert into sells values('2 Spring Rolls',31);
insert into sells values('Pho',31);
insert into sells values('Tilapia Fillet',32);
insert into sells values('Country Omelettes',32);
insert into sells values('Breakfast Croissant',32);
insert into sells values('6" Beef Reuben Grinder',33);
insert into sells values('6" Spicy Chicken Grinder',33);
insert into sells values('6" Meatball Grinder',33);
insert into sells values('Mike Dog',34);
insert into sells values('Taco in a Bag',34);
insert into sells values('Potato Chips',34);
insert into sells values('Foot Long Hot Dog',35);
insert into sells values('Corn Dog',35);
insert into sells values('Single Hamburger',35);
insert into sells values('Almond Joy Ice Cream',36);
insert into sells values('Espresso Chip Ice Cream',36);
insert into sells values('Buckeye Ice Cream',36);
insert into sells values('Ray Pruitt',37);
insert into sells values('Abe Froman',37);
insert into sells values('True Blue',37);
insert into sells values('Bacon Ranch Chicken Sandwich',38);
insert into sells values('Cheese Fries',38);
insert into sells values('Chicken and Waffle',38);

insert into ratings values('$4',3,1,3,01);
insert into ratings values('$6',4,4,5,02);
insert into ratings values('$5',4,3,3,03);
insert into ratings values('$2',5,5,5,04);
insert into ratings values('$4',4,4,3,05);
insert into ratings values('$6',5,5,5,06);
insert into ratings values('$5',3,4,3,07);
insert into ratings values('$5',5,4,5,08);
insert into ratings values('$8',5,4,5,09);
insert into ratings values('$8',4,4,4,10);
insert into ratings values('$7',3,1,1,11);
insert into ratings values('$5',3,3,2,12);
insert into ratings values('$8',4,4,4,13);
insert into ratings values('$5',5,5,5,14);
insert into ratings values('$9',5,4,5,15);
insert into ratings values('$7',3,4,2,16);
insert into ratings values('$9',5,4,5,17);
insert into ratings values('$9',5,5,5,18);
insert into ratings values('$6',5,5,4,19);
insert into ratings values('$7',5,5,5,20);
insert into ratings values('$13',5,3,4,21);
insert into ratings values('$6',3,3,1,22);
insert into ratings values('$4',4,3,3,23);
insert into ratings values('$4',4,3,3,24);
insert into ratings values('$4',3,2,1,25);
insert into ratings values('$9',4,4,4,26);
insert into ratings values('$9',5,5,5,27);
insert into ratings values('$6',4,3,5,28);
insert into ratings values('$5',4,3,4,29);
insert into ratings values('$7',4,4,5,30);
insert into ratings values('$7',4,4,4,31);
insert into ratings values('$7',5,5,5,32);
insert into ratings values('$6',5,4,5,33);
insert into ratings values('$3',3,3,2,34);
insert into ratings values('$5',4,4,5,35);
insert into ratings values('$5',5,5,5,36);
insert into ratings values('$5',5,5,5,37);
insert into ratings values('$5',5,3,4,38);

























