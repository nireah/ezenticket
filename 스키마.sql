--����-----------------------------------------------------------------------
drop table member CASCADE CONSTRAINTS;
drop table grade CASCADE CONSTRAINTS;
drop table concertDate CASCADE CONSTRAINTS;
drop sequence concertDate_seq;
drop table concert CASCADE CONSTRAINTS;
drop sequence concert_seq;
drop table place CASCADE CONSTRAINTS;
drop table seat CASCADE CONSTRAINTS;
drop table ticketing CASCADE CONSTRAINTS;
drop sequence ticketing_seq;


--����-----------------------------------------------------------------------
-- ȸ��
create table grade(
    gradeNo number(2) primary key,
    gradeName varchar2(30) not null
);
create table member(
    id varchar2(20) primary key,
    pw varchar2(20) not null,
    name varchar2(30) not null,
    profileImage varchar2(100),
    gender varchar2(12) default '���þ���' check (gender in('����', '����', '���þ���')),
    birth date not null,
    tel varchar2(13) not null,
    point number(10) default 0,
    regDate date default sysdate,
    conDate date default sysdate,
    status varchar2(6) default '����' check (status in('����', 'Ż��', '�޸�')),
    gradeNo number(2) default 1 REFERENCES grade(gradeNo) on delete cascade
);

-- �ܼ�Ʈ
create table place(
    placeNo number(20) primary key,
    placeName varchar2(50) not null unique
);
create table concert(
    no number(20) primary key,
    category varchar2(12) not null,
    name varchar2(50) not null,
    actor varchar2(50) not null,
    content varchar2(300),
    image varchar2(100),
    runtime varchar2(10) not null,
    age varchar2(30) not null,
    tour number(1) default 0 check (tour in(0, 1)),
    priceR number(10),
    priceS number(10),
    priceA number(10) not null
);
create sequence concert_seq;
create table concertDate(
    dno number(20) primary key,
    no number(20) not null references concert(no) on delete cascade,
    local varchar2(15),
    concertDate date not null,
    placeNo number(20) not null references place(placeNo) on delete cascade
);
create sequence concertDate_seq;

-- ����
create table ticketing(
    ticketNo number(20) primary key,
    dno number(20) references concertDate(dno) on delete cascade,
    id varchar2(20) not null references member(id) on delete cascade,
    cnt number(20) default 1,
    ticketDate varchar2(30) not null,
    --date not null,
    type varchar2(50),
    price number(10) not null,
    fee number(10) not null,
    total number(10) not null
);
create sequence ticketing_seq;
create table seat(
    ticketNo number(20) not null references ticketing(ticketNo) on delete cascade,
    seatGrade varchar2(3) not null,
    --check (seatGrade in('R', 'S', 'A')),
    seatNo varchar2(20) not null
);


--���õ�����-----------------------------------------------------------------
-- ���
insert into grade
values(1, '�Ϲ�ȸ��');
insert into grade
values(9, '������');
-- ȸ��
insert into member(id, pw, name, birth, tel, gradeNo)
values('admin', '1111', '������', to_date('98.03.18','yy.mm.dd'), '010-0000-0000', 9);
insert into member(id, pw, name, birth, tel)
values('test', '1111', 'ȫ�浿', to_date('98.03.18','yy.mm.dd'), '010-0000-0000');
insert into member(id, pw, name, birth, tel)
values('joo', '1111', '���ظ�', to_date('98.03.18','yy.mm.dd'), '010-0000-0000');

-- ��� ���
insert into place
values(1, '������ȭȸ�� �ڹ�Ȧ');
insert into place
values(2, '�������б� �밭��');
-- ���� ���
insert into concert(no, category, name, actor, content, image, runtime, age, tour, priceR, priceS, priceA)
values(concert_seq.nextval, 'Ʈ��Ʈ', '�̽���Ʈ��2', '�ἱ������ TOP7', '', '/upload/concert/mrtrot.jpg', '150��', '8�� �̻� ��������', 1, 132000, 110000, 99000);
insert into concert(no, category, name, actor, content, image, runtime, age, tour, priceR, priceS, priceA)
values(concert_seq.nextval, '���̵�', '���̽Ľ� �ܼ�Ʈ', '���̽Ľ�', '', '/upload/concert/day6.jpg', '150��', '8�� �̻� ��������', 0, 0, 110000, 99000);

insert into concert
values(concert_seq.nextval, '���̵�', '���õ�����', '���õ�����', '', '/upload/concert/default.jpg', '150��', '��ü������', 0, 0, 0, 100000);
commit;
-- ������ ���
insert into concertDate(dno, no, local, concertDate, placeNo)
values(concertDate_seq.nextval, 2, '', to_date('23.08.04 18:00','yy.mm.dd HH24:mi'), 1);
insert into concertDate(dno, no, local, concertDate, placeNo)
values(concertDate_seq.nextval, 2, '', to_date('23.08.05 18:00','yy.mm.dd HH24:mi'), 2);
insert into concertDate(dno, no, local, concertDate, placeNo)
values(concertDate_seq.nextval, 2, '', to_date('23.08.06 18:00','yy.mm.dd HH24:mi'), 1);

insert into concertDate(dno, no, local, concertDate, placeNo)
values(concertDate_seq.nextval, 3, '', to_date('23.03.05 18:00','yy.mm.dd HH24:mi'), 1);
-- ���� ���
insert into concertDate(dno, no, local, concertDate, placeNo)
values(concertDate_seq.nextval, 1, '����', to_date('23.08.04 18:00','yy.mm.dd HH24:mi'), 1);
insert into concertDate(dno, no, local, concertDate, placeNo)
values(concertDate_seq.nextval, 1, '�뱸', to_date('23.08.05 18:00','yy.mm.dd HH24:mi'), 2);
insert into concertDate(dno, no, local, concertDate, placeNo)
values(concertDate_seq.nextval, 1, '����', to_date('23.08.06 18:00','yy.mm.dd HH24:mi'), 1);
commit;

-- ����
insert into ticketing(ticketNo, dno, id, cnt, ticketDate, type, price, fee, total) values(ticketing_seq.nextval, 
1, 'test', 23, to_char(sysdate, 'yy.mm.dd hh24:mi'), '�ſ�ī��', 2420000, 23000, 2443000);

insert into seat values(1, 'S', 'B37');
insert into seat values(1, 'S', 'B38');
insert into seat values(1, 'S', 'D11');
insert into seat values(1, 'S', 'D12');
insert into seat values(1, 'S', 'D13');
insert into seat values(1, 'S', 'D14');
insert into seat values(1, 'S', 'D15');
insert into seat values(1, 'S', 'F8');
insert into seat values(1, 'S', 'F9');
insert into seat values(1, 'S', 'F10');
insert into seat values(1, 'S', 'K26');
insert into seat values(1, 'S', 'K27');
insert into seat values(1, 'S', 'K28');
insert into seat values(1, 'A', 'M18');
insert into seat values(1, 'A', 'M19');
insert into seat values(1, 'A', 'M20');
insert into seat values(1, 'A', 'M21');
insert into seat values(1, 'A', 'M29');
insert into seat values(1, 'A', 'M30');
insert into seat values(1, 'A', 'M31');
insert into seat values(1, 'A', 'O11');
insert into seat values(1, 'A', 'O12');
insert into seat values(1, 'A', 'O13');

insert into ticketing(ticketNo, dno, id, cnt, ticketDate, type, price, fee, total) values(ticketing_seq.nextval, 
1, 'joo', 1, to_char(sysdate, 'yy.mm.dd hh24:mi'), '�ſ�ī��', 110000, 1000, 111000);

insert into seat values(2, 'S', 'A14');
commit;