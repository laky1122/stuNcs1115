create table studentName(
	stuIdx int,
	stuName varchar(12),
primary key(stuIdx)
);

create table stuInfo(
	stuIdx int,
	stuAddr varchar(12),
	stuSchool varchar(12),
	stuDept varchar(12),
	FOREIGN KEY (stuIdx) REFERENCES studentName (stuIdx) 
);

insert into studentName values (1,'김아무개');
insert into studentName values (2,'홍길동');
insert into studentName values (3,'김길동');
insert into studentName values (4,'가나다');
insert into studentName values (5,'김밥');

insert into stuInfo values(1,'논현동','아무대학교','세무회계과');
insert into stuInfo values(2,'논현동','서울대학교','심리학과');
insert into stuInfo values(3,'안암동','고려대학교','간호학과');

insert into stuInfo values(4,'십정동','연세대학교','심리학과');
insert into stuInfo values(5,'일원동','세종대학교','소프트웨어학과');

select stuIdx, stuName, stuAddr, stuSchool, stuDept from studentName natural join stuInfo where stuIdx=1

select * from studentName;
select * from stuInfo;

delete from studentName ;


commit;
