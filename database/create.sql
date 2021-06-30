create table user (
    id INTEGER primary key,
    username varchar(50),
    hash varchar(60)
);
create table race_dict(
    id integer primary key,
    name varchar(20),
    side integer check(
        side = 1
        or side = 2
    )
);
create table class_dict(
    id integer primary key,
    name varchar(20)
);
create table spec_dict(
    id integer primary key,
    name varchar(20),
    class_id integer references class_dict(id) on update cascade on delete cascade
);
create table race_class_dict(
    id integer primary key,
    class_id integer references class_dict(id) on update cascade on delete cascade,
    race_id integer references race_dict(id) on update cascade on delete cascade
);
create table character(
    id INTEGER PRIMARY KEY,
    name VARCHAR(50),
    race integer REFERENCES race_dict(id) on update cascade on delete RESTRICT,
    server VARCHAR(50),
    class integer references class_dict(id) on update cascade on delete restrict,
    spec integer references spec_dict(id) on update cascade on delete restrict,
    user_id integer references user(id) on update cascade on delete cascade,
    level integer,
    item_level integer
);
create table token_blacklist(
    id integer primary key,
    jti varchar(36),
    created_at timestamp
);