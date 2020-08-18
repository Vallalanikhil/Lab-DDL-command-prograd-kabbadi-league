-- PROGRESSION - 1


-- 1. **Create table city**

-- 2. **Create table referee**

-- 3. **Create table innings**

-- 4. **Create table extra_type**

-- 5. **Create table skill**

-- 6. **Create table team**

-- 7. **Create table player**

-- 8. **Create table venue**

-- 9. **Create table event**
-- 10. **Create table extra_event**

-- 11. **Create table outcome**

-- 12. **Create table game**

-- 13. **Drop table city**

-- 14. **Drop table innings**

-- 15. **Drop table skill**

-- 16. **Drop table extra_type**

create table city
( id number(11),
name varchar(50) not null,
constraint city_pk primary key(id)
);

create table referee
( id number(11),
name varchar(50) not null,
constraint referee_pk primary key(id)
);

create table innings
( id number(11),
innings_number int not null,
constraint innings_pk primary key(id)
);

create table extra_type
( id number(11),
name varchar(50) not null,
constraint extra_type_pk primary key(id)
);

create table skill
( id number(11),
name varchar(50) not null,
constraint skill_pk primary key(id)
);

create table team
( id number(11),
name varchar(50) not null,
coach varchar(50) not null,
home_city number(11) not null,
captain number(11) not null,
constraint team_pk primary key(id),
constraint team_fk1 foreign key(home_city) references city(id)
);

create table player
( id number(11),
name varchar(50) not null,
country varchar(50)not null,
skill_id number(11) not null,
team_id number(11) not null,
constraint player_pk primary key(id),
constraint player_fk1 foreign key(skill_id) references skill(id),
constraint player_fk2 foreign key(team_id) references team(id)
);

create table venue
( id number(11),
stadium_name varchar(50) not null,
city_id number(11) not null,
constraint venue_pk primary key(id),
constraint venue_fk foreign key(city_id) references city(id)
);

create table event 
( id number(11),
innings_id number(11) not null,
event_no number(11)not null,
raider_id number(11)not null,
raid_points number(11)not null,
defending_points number(11) not null,
clock_in_seconds number(11) not null,
team_one_score number(11) not null,
team_two_score number(11) not null,
constraint event_pk primary key(id),
constraint event_fk1 foreign key(innings_id) references innings(id),
Constraint event_fk2 foreign key(raider_id) references raider(id)
);

create table extra_event
( id number(11),
event_id number(11)not null,
extra_type_id number(11) not null,
points number(11) not null,
scoring_team_id number(11) not null,
constraint extra_event_pk primary key(id),
constraint extra_event_fk1 foreign key(event_id) references event(id),
constraint extra_event_fk2 foreign key(extra_type_id) references extra_type(id),
constraint extra_event_fk3 foreign key(scoring_team_id) references scoring_team(id)
);
create table outcome
( id number(11),
status varchar(100) not null,
winner_team_id number(11),
score number(11),
player_of_match number(11),
constraint outcome_pk primary key(id),
constraint outcome_fk1 foreign key(winner_team_id) references winner_team(id),
constraint outcome_fk2 foreign key(player_of_match) references player(id)
);

create table game
( id number(11),
game_date DATE not null,
team_id_1 number(11) not null,
team_id_2 number(11) not null,
venue_id number(11) not null,
outcome_id number(11) not null,
referee_id_1 number(11) not null,
referee_id_2 number(11) not null,
first_innings_id number(11) not null,
second_innings_id number(11) not null,
constraint game_pk primary key(id),
constraint game_fk1 foreign key(team_id_1) references team(id),
constraint game_fk2 foreign key(team_id_2) references team(id),
constraint game_fk3 foreign key(venue_id) references venue(id),
constraint game_fk4 foreign key(outcome_id) references outcome(id),
constraint game_fk5 foreign key(referee_id_1) references referee(id),
constraint game_fk6 foreign key(referee_id_2) references referee(id),
constraint game_fk7 foreign key(first_innings_id) references innings(id),
constraint game_fk8 foreign key(second_innings_id) references innings(id)
);

