create schema pesquisai;

create table pesquisai.requests (

                                   id UUID primary key,

                                   context VARCHAR(1000),

                                   research VARCHAR(1000),

                                   total_researches INT default 0,

                                   total_finished_researches INT default 0,

                                   status VARCHAR(10) DEFAULT 'PENDING',

                                   overall TEXT,

                                   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

                                   updated_at TIMESTAMP

);



create table pesquisai.researches (

                                    id UUID primary key,

                                    request_id UUID ,

                                    title VARCHAR(50),

                                    link VARCHAR(100),

                                    status VARCHAR(10) DEFAULT 'PROCESSING',

                                    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

                                    updated_at TIMESTAMP,

                                    summary TEXT,

                                    foreign key (request_id) references pesquisai.requests(id)


);


create table pesquisai.locations (

                                    id varchar(10) primary key

);


create table pesquisai.request_locations (

                                            request_id UUID,

                                            location_id varchar(10),

                                            primary key (request_id,location_id),

                                            foreign key (request_id) references pesquisai.requests(id),

                                            foreign key (location_id) references pesquisai.locations(id)

);



create table pesquisai.languages (
                                    id VARCHAR(10) primary key

);



create table pesquisai.request_languages (

                                            request_id UUID,

                                            language_id varchar(10),

                                            primary key (request_id,language_id),

                                            foreign key (request_id) references pesquisai.requests(id),

                                            foreign key (language_id) references pesquisai.languages(id)

);


