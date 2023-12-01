create schema climb_schema;

create table climb_schema.climbing(
	climbing_id serial,
    start_date date not null,
	finish date not null,
	constraint pk_climbing_climbing_id primary key(climbing_id) 
);

create table climb_schema.climber(
	climber_id serial,
    first_name varchar(20) default 'name',
	last_name varchar(20) default 'name',
	constraint pk_climber_climber_id primary key(climber_id) 
);

create table climb_schema.mountain(
	mountain_id serial,
    mountain_name varchar(20) default 'name',
    heigh int not null,
	constraint pk_mountain_mountain_id primary key(mountain_id) 
	
);

create table climb_schema.mountain_location(
	mountain_location_id serial,
    area varchar(30) default 'name',
	country varchar(30) default 'name',
	constraint pk_mountain_location_mountain_location_id primary key(mountain_location_id) 
);

create table climb_schema.equipment(
	equipment_id serial,
    name_equipment varchar(20) default 'name',
	constraint pk_equipment_equipment_id primary key(equipment_id) 
	
);

create table climb_schema.climber_equipment(
     amount int not null,
	 climber_id int references climb_schema.climber(climber_id),
	 equipment_id int references climb_schema.equipment(equipment_id),
	 constraint pk_climber_equipment primary key (climber_id, equipment_id)
);


create table climb_schema.climber_address(
	climber_address_id serial,
    country varchar(30) default 'name',
	sity varchar(30) default 'name',
	street varchar(30) default 'name',
	constraint pk_climb_adress_climb_address_id primary key(climber_address_id) 
);

create table climb_schema.guide(
	guide_id serial,
    first_name varchar(20) default 'name',
	last_name varchar(20) default 'name',
	constraint pk_guide_guide_id primary key(guide_id) 
);

alter table climb_schema.climbing
add column climber_id int

alter table climb_schema.climbing
add constraint fk_climbing_climber_id 
foreign key (climber_id) references climb_schema.climber(climber_id );

alter table climb_schema.climbing
add column mountain_id int

alter table climb_schema.climbing
add constraint fk_climbing_mountain_id
foreign key (mountain_id) references climb_schema.mountain(mountain_id);

alter table climb_schema.climbing
add column equipment_id int

alter table climb_schema.climbing
add constraint fk_climbing_equipment_id
foreign key (equipment_id) references climb_schema.equipment(equipment_id);
alter table climb_schema.climbing
add constraint chk_date check (start_date > '2000-01-01')




alter table climb_schema.climber
add column climber_address_id int

alter table climb_schema.climber
add constraint fk_climber_climber_address_id
foreign key (climber_address_id) references climb_schema.climber_address(climber_address_id);

alter table climb_schema.climber
add column guide_id int

alter table climb_schema.climber
add constraint fk_climber_guide_id
foreign key (guide_id) references climb_schema.guide(guide_id)

alter table  climb_schema.climber
add column gender text

alter table  climb_schema.climber
add constraint chk_gender check (gender = 'male' or gender = 'female')




alter table climb_schema.mountain
add column mountain_location_id int

alter table climb_schema.mountain
add constraint fk_mountain_mountain_locatio_id
foreign key (mountain_location_id) references climb_schema.mountain_location(mountain_location_id)

create table climber_mountain(
    climber_id int references climb_schema.climber(climber_id),
	mountain_id int references climb_schema.mountain(mountain_id),
	constraint pk_climber_mountains primary key (climber_id, mountain_id)
);

alter table climb_schema.mountain
add constraint chk_heigh check (heigh > 0)

alter table climb_schema.mountain
add column mountain_location_id int

alter table  climb_schema.mountain
add constraint unq_mountain_name unique (mountain_name)



alter table climb_schema.climber_equipment
add constraint chk_amount check (amount > 0)



insert into climb_schema.guide (first_name, last_name)
values ('Corey', 'Taylor'), ('Alister', 'Crowly');

insert into climb_schema.climber_address (country, sity, street)
values ('USA', 'Iowa', 'Hleb avenue'), ('USA', 'Iowa', 'Voda street'),
('UK', 'London', 'Bloody roots street'), ('UK', 'London', 'Salo boulevard');

insert into climb_schema.climber (first_name, last_name, climber_address_id, guide_id, gender)
values ('Shon','Chrehan', 1, 1, 'male'), ('Alice', 'Fox', 2, 1, 'female'),
('Oliver', 'Sykes', 3, 2, 'male'), ('Alex','Terrible', 4, 2, 'male');

insert into climb_schema.equipment (name_equipment)
values ('ice ax'), ('rope');

insert into climb_schema.climber_equipment (amount, climber_id, equipment_id)
values (4, 1, 1), (2, 2, 2), (4, 3, 1), (3, 4, 2);

insert into climb_schema.mountain_location (area, country)
values ('Himalayas', 'Nepal-Tibet border'), ('East Africa', 'Tanzania');

insert into climb_schema.mountain (mountain_name, heigh, mountain_location_id)
values ('Everest', 8.848, 1), ('Kilimanjaro', 5.895, 2);

insert into climb_schema.climbing (start_date, finish, climber_id, mountain_id, equipment_id)
values ('2007-02-11', '2007-02-14', 1, 1, 1),
('2007-02-11', '2007-02-14', 2, 1, 2), ('2010-10-01', '2010-10-03', 3, 2, 2),
('2010-10-01', '2010-10-03', 4, 2, 1);

alter table climb_schema.climbing
add column record_ts date default current_date;

update climb_schema.climbing
set record_ts = current_date
where record_ts is null;

alter table climb_schema.mountain
add column record_ts date default current_date;

update  climb_schema.mountain
set record_ts = current_date
where record_ts is null;

alter table climb_schema.mountain_location
add column record_ts date default current_date;

update climb_schema.mountain_location
set record_ts = current_date
where record_ts is null;

alter table climb_schema.climber_equipment
add column record_ts date default current_date;

update climb_schema.climber_equipment
set record_ts = current_date
where record_ts is null;

alter table climb_schema.equipment
add column record_ts date default current_date;

update climb_schema.equipment
set record_ts = current_date
where record_ts is null;

alter table  climb_schema.climber
add column record_ts date default current_date;

update  climb_schema.climber
set record_ts = current_date
where record_ts is null;

alter table climb_schema.climber_address
add column record_ts date default current_date;

update climb_schema.climber_address
set record_ts = current_date
where record_ts is null;

alter table climb_schema.guide
add column record_ts date default current_date;

update climb_schema.guide
set record_ts = current_date
where record_ts is null;



