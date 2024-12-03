--Final ISDM Database Script--

--flixticket_movies--


--MANAGER TABLE--
Create Table Manager
(
	Manager_id char(10) not null,		 
	MFname varchar(50),				
	MLname varchar(50),				
	Maddress varchar(300),			
	Mpassword varchar(20),			
	Musername varchar(20),			

	Constraint Manager_PK
	Primary Key(Manager_id),

	Constraint chk_Mananager check (Manager_id like '[M][I][D][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);


--MANAGER_PHONE TABLE--
Create Table Manager_phone
(
	MP_id char(8) not null,
	Mphone varchar(12),
	Manager_id char(10),

	Constraint Manager_phone_PK
	Primary Key(MP_id),

	Constraint Manager_phone_FK
	Foreign Key(Manager_id) 
	References Manager(Manager_id),

	Constraint chk_Manager_phone1 check (MP_id like '[M][P][0-9][0-9][0-9][0-9][0-9][0-9]'),
	Constraint chk_Manager_phone2 check (Mphone like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	Constraint chk_Manager_phone3 check (Manager_id like '[M][I][D][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);	


--MANAGER_EMAIL TABLE--
Create Table Manager_email
(
	ME_id char(8) not null,
	Memail varchar(50),
	Manager_id char(10),

	Constraint Manager_email_PK
	Primary Key(ME_id),

	Constraint Manager_email_FK
	Foreign Key(Manager_id)
	References Manager(Manager_id),

	Constraint chk_Manager_email1 check (ME_id like '[M][E][0-9][0-9][0-9][0-9][0-9][0-9]'),
	Constraint chk_Manager_email2 check (Manager_id like '[M][I][D][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')	
);


--ADMINISTRATOR TABLE--
Create Table Administrator
(
	Admin_id char(10),
	AFname varchar(50),
	ALname varchar(50),
	Aaddress varchar(300),
	Apassword varchar(20),
	Ausername varchar(20),
	Manager_id char(10),

	Constraint Administrator_PK
	Primary Key(Admin_id),

	Constraint Administrator_FK
	Foreign Key(Manager_id) 
	References Manager(Manager_id),

	Constraint chk_Administrator1 check (Admin_id like '[A][I][D][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	Constraint chk_Administrator2 check (Manager_id like '[M][I][D][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);


--ADMINSTRATOR_PHONE TABLE--
Create Table Administrator_phone
(
	AP_id char(8) not null,
	Aphone varchar(12),
	Admin_id char(10),

	Constraint Administrator_phone_PK
	Primary Key(AP_id),

	Constraint Administrator_phone_FK
	Foreign Key(Admin_id) 
	References Administrator(Admin_id),

	Constraint chk_Administrator_phone1 check (AP_id like '[A][P][0-9][0-9][0-9][0-9][0-9][0-9]'),
	Constraint chk_Administrator_phone2 check (Aphone like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	Constraint chk_Administrator_phone3 check (Admin_id like '[A][I][D][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);


--ADMINISTRATOR_EMAIL TABLE--
Create Table Administrator_email
(
	AE_id char(8) not null,
	Aemail varchar(50),
	Admin_id char(10),

	Constraint Administrator_email_PK
	Primary Key(Aemail, Admin_id),

	Constraint Administrator_email_FK
	Foreign Key(Admin_id) 
	References Administrator(Admin_id),

	Constraint chk_Administrator_email1 check (AE_id like '[A][E][0-9][0-9][0-9][0-9][0-9][0-9]'),
	Constraint chk_Administrator_email2 check (Admin_id like '[A][I][D][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);


--REGISTERED_CUSTOMER TABLE--
Create Table Registered_Customer
(
	Customer_id char(10),
	CFname varchar(50),
	CLname varchar(50),
	CAddress varchar(200),
	Cpassword varchar(20),
	Cusername varchar(20),
	C_DOB date not null,

	Constraint Registered_Customer_PK
	Primary Key(Customer_id),

	Constraint chk_Registered_Customer check (Customer_id like '[C][I][D][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);


--REGISTERED_CUSTOMER_PHONE TABLE--
Create Table Registered_Customer_phone
(
	CP_id char(8) not null, 
	Cphone varchar(12),
	Customer_id char(10), 

	Constraint Registered_Customer_phone_PK
	Primary Key(CP_id),

	Constraint Registered_Customer_phone_FK
	Foreign Key (Customer_id)
	References Registered_Customer(Customer_id),

	Constraint chk_Registered_Customer_phone1 check (CP_id like '[C][P][0-9][0-9][0-9][0-9][0-9][0-9]'),
	Constraint chk_Registered_Customer_phone2 check (Customer_id like '[C][I][D][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);


--REGISTERED_CUSTOMER_EMAIL TABLE--
Create Table Registered_Customer_email
(
	CE_id char(8) not null,
	Cemail varchar(50),
	Customer_id char(10),

	Constraint Registered_Customer_email_PK
	Primary Key(CE_id),

	Constraint Registered_Customer_email_FK
	Foreign Key(Customer_id)
	References Registered_Customer(Customer_id),

	Constraint chk_Registered_Customer_email1 check (CE_id like '[C][E][0-9][0-9][0-9][0-9][0-9][0-9]'),
	Constraint chk_Registered_Customer_email2 check (Customer_id like '[C][I][D][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);


--INQUIRIES TABLE--
Create Table Inquiries
(
	In_id char(10) not null,
	In_Date date not null,
	Inquiry varchar(1000),
	Customer_id char(10),

	Constraint Inquiries_PK
	Primary Key(In_id),

	Constraint Inquiries_FK
	Foreign Key(Customer_id) 
	References Registered_Customer(Customer_id),

	Constraint chk_Inquiries1 check (In_id like '[I][I][D][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	Constraint chk_Inquiries2 check (Customer_id like '[C][I][D][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);


--REPORTS TABLE--
Create Table Reports
(
	R_id char(10) not null,
	R_date date not null,
	R_type char(20),
	Manager_id char(10),

	Constraint Reports_PK 
	Primary Key(R_id),

	Constraint Reports_FK
	Foreign Key(Manager_id) 
	References Manager(Manager_id),

	Constraint chk_Reports1 check (R_id like '[R][I][D][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	Constraint chk_Reports2 check (Manager_id like '[M][I][D][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);


--MOVIE_SHOW TABLE--
Create Table Movie_Show
(
	Show_id char(10) not null,
	Movie_name varchar (100),
	Movie_language varchar(35),
	Start_time time not null,
	Admin_id char(10),

	Constraint Movie_Show_PK
	Primary Key(Show_id),

	Constraint Movie_Show_FK
	Foreign Key(Admin_id) 
	References Administrator(Admin_id),

	Constraint chk_Movie_Show1 check (Show_id like '[S][I][D][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	Constraint chk_Movie_Show2 check (Admin_id like '[A][I][D][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);


--MOVIE TABLE--
Create Table Movie
(
	Movie_id char(10) not null,
	Producer varchar(200),
	Movie_Description varchar(2000),
	Movie_Stars varchar(500),
	Movie_Title varchar(1000),
	Show_id char(10),

	Constraint Movie_PK
	Primary Key(Movie_id),

	Constraint Movie_FK
	Foreign Key(Show_id) 
	References Movie_Show(Show_id),

	Constraint chk_Movie1 check (Movie_id like '[F][I][D][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	Constraint chk_Movie2 check (Show_id like '[S][I][D][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);


--TICKET TABLE--
Create Table Ticket
(
	Ticket_id char(10) not null,
	Show_date date not null,
	Hall_no int,
	Price decimal(10,2),
	Show_id char(10),

	Constraint Ticket_PK
	Primary Key(Ticket_id),

	Constraint Ticket_FK
	Foreign Key(Show_id) 
	References Movie_Show(Show_id),

	Constraint chk_Ticket1 check (Ticket_id like '[T][I][D][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	Constraint chk_Ticket2 check (Show_id like '[S][I][D][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);


--BOOKINGS TABLE--
Create Table Bookings
(
	Booking_id char(10) not null,
	Booking_time time not null,
	Ticket_type varchar(20),
	Number_of_tickets int,
	Customer_id char(10),

	Constraint Bookings_PK
	Primary Key(Booking_id),

	Constraint Bookings_FK
	Foreign Key(Customer_id) 
	References Registered_Customer(Customer_id),

	Constraint chk_Bookings1 check (Booking_id like '[B][I][D][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	Constraint chk_Bookings2 check (Customer_id like '[C][I][D][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);


--PAYMENTS TABLE--
Create Table Payments
(
	Payment_id char(10) not null,
	Payment_time time not null,
	Amount decimal(10,2),
	Card_Number char(16),
	CVV_Number char(3),
	Customer_id char(10),

	Constraint Payments_PK
	Primary Key(Payment_id),

	Constraint Payments_FK 
	Foreign Key(Customer_id) 
	References Registered_Customer(Customer_id),

	Constraint chk_Payments1 check (Payment_id like '[P][I][D][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	Constraint chk_Payments2 check (Customer_id like '[C][I][D][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);


--PAYMENTS_TYPE TABLE--
Create Table Payments_type
(
	PT_id char(8) not null,
	Payment_type varchar(50),
	Payment_id char(10),

	Constraint Payments_type_PK
	Primary Key (PT_id),

	Constraint Payments_type_FK
	Foreign Key (Payment_id)
	References Payments(Payment_id),

	Constraint chk_Payments_type1 check (PT_id like '[P][T][0-9][0-9][0-9][0-9][0-9][0-9]'),
	Constraint chk_Payments_type2 check (Payment_id like '[P][I][D][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);


--DISCOUNT TABLE--
Create Table Discount
(
	Offer_id char(10) not null,
	price decimal(10,2),
	Ticket_id char(10),
	Customer_id char(10),

	Constraint Discount_PK
	Primary Key(Offer_id),

	Constraint Discount_FK1
	Foreign Key(Ticket_id) 
	References Ticket(Ticket_id),

	Constraint Discount_FK2
	Foreign Key(Customer_id) 
    References Registered_Customer(Customer_id),

	Constraint chk_Discount1 check (Offer_id like '[O][I][D][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	Constraint chk_Discount2 check (Ticket_id like '[T][I][D][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	Constraint chk_Discount3 check (Customer_id like '[C][I][D][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);


--FEEDBACK TABLE--
Create Table Feedback
(
	F_id char(10) not null,
	F_date date not null,
	Content varchar(3000),
	Rate int,
	Customer_id char(10),

	Constraint Feedback_PK
	Primary Key(F_id),

	Constraint Feedback_FK 
	Foreign Key(Customer_id) 
	References Registered_Customer(Customer_id),

	Constraint chk_Feedback1 check (F_id like '[X][I][D][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	Constraint chk_Feedback2 check (Customer_id like '[C][I][D][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);


--THEATER TABLE--
Create Table Theater
(
	Theater_ID char(10) not null,
	T_Location varchar(100),
	Movie_name varchar(200),
	Theater_name varchar(200),

	Constraint Theater_PK
	Primary Key(Theater_id),

	Constraint chk_Theater check (Theater_id like '[H][I][D][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);


--SCREEN TBALE--
Create Table Screen
(
	Screen_id char(10) not null,
	Screen_no int,
	Screen_name varchar(200),
	No_Of_Seats int,
	Theater_id char(10),

	Constraint Screen_PK
	Primary Key(Screen_id),

	Constraint Screen_FK 
	Foreign Key(Theater_id) 
	References Theater(Theater_id),

	Constraint chk_Screen1 check (Screen_id like '[Y][I][D][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	Constraint chk_Screen2 check (Theater_id like '[H][I][D][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);


--SHOW_THEATER TABLE--
Create Table Show_Theater
(
	ST_id char(8) not null,
	Show_id char(10),
	Theater_id char(10),

	Constraint Show_Theater_PK 
	Primary Key(ST_id),

	Constraint Show_Theater_FK_1
	Foreign Key(Show_id) 
	References Movie_Show(Show_id),

	Constraint Show_Theater_FK_2
	Foreign Key(Theater_id) 
	References Theater(Theater_ID),

	Constraint chk_Show_Theater1 check (ST_id like '[S][T][0-9][0-9][0-9][0-9][0-9][0-9]'),
	Constraint chk_Show_Theater2 check (Show_id like '[S][I][D][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	Constraint chk_Show_Theater3 check (Theater_id like '[H][I][D][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);


--Manager table data--

	INSERT INTO Manager VALUES ('MID0000001', 'Kamal', 'Gunarathne', 'No.258/7, Kandy road, Colombo', 'password123', 'Kamal123' );
	INSERT INTO Manager VALUES ('MID0000002','Thisara', 'Silva', 'No.56, Dehiwala road, Kollupitiya', 'password34', 'Silva112' );
	INSERT INTO Manager VALUES ('MID0000003', 'Thilina', 'Subhasinghe', 'No.25/3, Mahinda road, Wallawaththa', 'passwordABC', 'Thilina752' );
	INSERT INTO Manager VALUES ('MID0000004', 'Chalana', 'Hettiarachchi', 'No.225, Padaviya rod Homagama', 'password36A', 'Chalana562' );
	INSERT INTO Manager VALUES ('MID0000005', 'Wimal', 'Thilakawardhane', 'No.123/8, Makandura road, Dehiwala', 'password22cd', 'Wimal789' );


--Manager_Phone table data--

	INSERT INTO Manager_phone VALUES ('MP000001', '0724567895', 'MID0000001' );
	INSERT INTO Manager_phone VALUES ('MP000002', '0784561236', 'MID0000002' );
	INSERT INTO Manager_phone VALUES ('MP000003', '0751567896', 'MID0000003' );
	INSERT INTO Manager_phone VALUES ('MP000004', '0761235896', 'MID0000004' );
	INSERT INTO Manager_phone VALUES ('MP000005', '0774567892', 'MID0000005' );


--Manager_Email table data--

	INSERT INTO Manager_email VALUES ('ME000001', 'kamalgunarathne@gmail.com', 'MID0000001');
	INSERT INTO Manager_email VALUES ('ME000002', 'thisarasilva@gmail.com', 'MID0000002' );
	INSERT INTO Manager_email VALUES ('ME000003', 'thilinasubhasinghe@gmail.com', 'MID0000003' );
	INSERT INTO Manager_email VALUES ('ME000004', 'chalana562@gmail.com', 'MID0000004' );
	INSERT INTO Manager_email VALUES ('ME000005', 'wimal22@gmail.com', 'MID0000005' );


--Administrator table data--

	INSERT INTO Administrator VALUES ('AID0000001', 'Tharusha', 'Kasthuriarachchi', 'No.36, Kalaniya road, Mawathagama', 'password123', 'tharushaL123', 'MID0000001' );
	INSERT INTO Administrator VALUES ('AID0000002', 'Sudarshana', 'Dayarathne', 'No.45/8 Singhapura road, Dikwella', 'password12R', 'sudarshanaR123', 'MID0000002' );
	INSERT INTO Administrator VALUES ('AID0000003', 'Chiranga', 'Marasinghe', 'No.233/1, Papiliyana road, Battaramulla', 'password23S', 'chirangaS123', 'MID0000003' );
	INSERT INTO Administrator VALUES ('AID0000004', 'Oshini', 'Wijewickrama', 'No.53, Kakirawa road, Ingiriya', 'password22OS', 'Oshini123', 'MID0000004' );
	INSERT INTO Administrator VALUES ('AID0000005', 'Ranugi', 'Panditharathne', 'No.2, Galle road, Colombo 06', 'password22', 'ranugiL123', 'MID0000005' );


--Administrator_Phone table data--
	
	INSERT INTO Administrator_phone VALUES ('AP000001', '0754698532', 'AID0000001' );
	INSERT INTO Administrator_phone VALUES ('AP000002','0714561236', 'AID0000002' );
	INSERT INTO Administrator_phone VALUES ('AP000003','0784562315', 'AID0000003' );
	INSERT INTO Administrator_phone VALUES ('AP000004','0701234567', 'AID0000004' );
	INSERT INTO Administrator_phone VALUES ('AP000005','0747539516', 'AID0000005' );


--Administrator_Email table data--

	INSERT INTO Administrator_email VALUES ('AE000001','tharushak@gmail.com', 'AID0000001' );
	INSERT INTO Administrator_email VALUES ('AE000002','sudarshanad@gmail.com', 'AID0000002' );
	INSERT INTO Administrator_email VALUES ('AE000003','chirangam@gmail.com', 'AID0000003' );
	INSERT INTO Administrator_email VALUES ('AE000004','oshiniw@gmail.com', 'AID0000004' );
	INSERT INTO Administrator_email VALUES ('AE000005','ranugip@gmail.com', 'AID0000005' );
	

--Registered_Customer table data--

	INSERT INTO Registered_Customer VALUES ('CID0000001', 'Anil', 'Jayasooriya', 'No. 26/8, Thalnagama road, Galle', 'password123', 'Anil123', '1999-12-05' );
	INSERT INTO Registered_Customer VALUES ('CID0000002', 'Damayanthi', 'Ranasinghe', 'No.235, Mahawewa road, Rathmalana', 'password345', 'damayanthi345', '2000-04-01' );
	INSERT INTO Registered_Customer VALUES ('CID0000003', 'Amara', 'Rajapakse', 'No.56, Jaya road, Rathnapura', 'password678', 'amara@678', '1995-02-25');
	INSERT INTO Registered_Customer VALUES ('CID0000004', 'Nayana', 'Wikramasinghe', 'No.58/1, Kaikar road, Jaffna', 'password56', 'Nayana56', '2001-11-28' );
	INSERT INTO Registered_Customer VALUES ('CID0000005', 'Upuli', 'Ranathunga', 'No.38, Galle road, Kaluthara', 'password22', 'Upuli22', '1990-10-15' );


--Registered_Customer_Phone table data--

	INSERT INTO Registered_Customer_phone VALUES ('CP000001','0712365478', 'CID0000001' );
	INSERT INTO Registered_Customer_phone VALUES ('CP000002','0784523695', 'CID0000002' );
	INSERT INTO Registered_Customer_phone VALUES ('CP000003','0768954125', 'CID0000003' );
	INSERT INTO Registered_Customer_phone VALUES ('CP000004','0771258963', 'CID0000004' );
	INSERT INTO Registered_Customer_phone VALUES ('CP000005','0702589656', 'CID0000005' );


--Registered_Customer_Email table data--

	INSERT INTO Registered_Customer_email VALUES ('CE000001','anil123@gmail.com', 'CID0000001');
	INSERT INTO Registered_Customer_email VALUES ('CE000002','damayanthi345@gmail.com', 'CID0000002');
	INSERT INTO Registered_Customer_email VALUES ('CE000003','amara678@gmail.com', 'CID0000003');
	INSERT INTO Registered_Customer_email VALUES ('CE000004','nayana56@gmail.com', 'CID0000004');
	INSERT INTO Registered_Customer_email VALUES ('CE000005','upuli223@gmail.com', 'CID0000005');


--Inquiries table data--

	INSERT INTO Inquiries VALUES ('IID0000001', '2023-02-15', 'Can I book my preferred seats when booking movie tickets online?', 'CID0000001' );
	INSERT INTO Inquiries VALUES ('IID0000002', '2023-04-02', 'Can I receive a digital ticket or do I need it to print out?', 'CID0000002' );
	INSERT INTO Inquiries VALUES ('IID0000003', '2022-12-20', 'Is there any mobile application available for the online movie ticket booking system?', 'CID0000003' );
	INSERT INTO Inquiries VALUES ('IID0000004', '2022-12-31', 'Are there any discounts or promotions available for online movie ticket bookings?', 'CID0000004' );
	INSERT INTO Inquiries VALUES ('IID0000005', '2023-01-01', 'How far in advance tickets can be booked?', 'CID0000005' );
	
	
--Reports table data--

	INSERT INTO Reports VALUES ('RID0000001', '2023-05-23', 'Monthly', 'MID0000001' );
	INSERT INTO Reports VALUES ('RID0000002', '2023-03-26', 'Weekly', 'MID0000002' );
	INSERT INTO Reports VALUES ('RID0000003', '2023-01-20', 'Weekly', 'MID0000003' );
	INSERT INTO Reports VALUES ('RID0000004', '2022-11-27', 'Monthly', 'MID0000004' );
	INSERT INTO Reports VALUES ('RID0000005', '2022-09-25', 'Weekly', 'MID0000005' );


--Movie_Show table data--

	INSERT INTO Movie_Show VALUES ('SID0000001', 'The Flash (2023)', 'English', '08:00', 'AID0000001' );
	INSERT INTO Movie_Show VALUES ('SID0000002', 'Tu Jhoothi Main Makkaar (2023)', 'Hindi', '13:00', 'AID0000002' );
	INSERT INTO Movie_Show VALUES ('SID0000003', 'Ksheera Sagaraya Kalabina-KSK (2023)', 'Sinhala', '08:00', 'AID0000003' );
	INSERT INTO Movie_Show VALUES ('SID0000004', 'Ponniyin Selvan: Part Two (2023)', 'Tamil', '17:00', 'AID0000004' );
	INSERT INTO Movie_Show VALUES ('SID0000005', 'The Little Mermaid - Disney (2023)', 'English', '10:00', 'AID0000005' );


--Movie table data--

	INSERT INTO Movie VALUES ('FID0000001', 'Bob Marshall', 'Worlds collide when the Flash uses his superpowers 
								to travel back in time to change the events of the past.', 5 , 'The Flash', 'SID0000001' );

	INSERT INTO Movie VALUES ('FID0000002', 'Rahul Mody', 'Madness ensues when a payer in the world of romantic relationships 
								finds a girl whos a worthy opponent, that believes love is a battle of wits.', 4 , 'Tu Jhoothi Main Makkaar', 'SID0000002' );

	INSERT INTO Movie VALUES ('FID0000003', 'Sunil Ariyarathne', 'An emperor in the midst of a existentialist crisis leaves his official seat of power 
								where he is beaten and threated by a virgin suffering from the pague.', 5 , 'Ksheera Sagaraya Kalabina ', 'SID0000003' );

	INSERT INTO Movie VALUES ('FID0000004', 'Mani Ratnam', 'Arulmozhi Varman continues on his journey to become Rajaraja I, the greatest ruler of the 
								historic Chola empires of South India.', 4 , 'Ponniyin Selvan II ', 'SID0000004' );

	INSERT INTO Movie VALUES ('FID0000005', 'Jacob Tremblay', 'The Little Mermaid is the beloved story of Ariel, a beautiful and spirited
								young mermaid with a thirst of adventure.', 3 , 'The Little Mermaid', 'SID0000005' );


--Ticket table data--
	
	INSERT INTO Ticket VALUES ('TID0000001', '2023-06-16', 001 , 2000.00, 'SID0000001' );
	INSERT INTO Ticket VALUES ('TID0000002', '2023-06-07', 002 , 1500.00, 'SID0000002' );
	INSERT INTO Ticket VALUES ('TID0000003', '2023-06-27', 003 , 1000.00, 'SID0000003' );
	INSERT INTO Ticket VALUES ('TID0000004', '2023-07-08', 004 , 2000.00, 'SID0000004' );
	INSERT INTO Ticket VALUES ('TID0000005', '2023-05-26', 005 , 500.00, 'SID0000005' );


--Bookings table data--

	INSERT INTO Bookings VALUES ('BID0000001', '08:00', 'Normal', 05 , 'CID0000001' );
	INSERT INTO Bookings VALUES ('BID0000002', '10:00', 'Normal', 03 , 'CID0000002' );
	INSERT INTO Bookings VALUES ('BID0000003', '13:00', 'VIP', 01 , 'CID0000003' );
	INSERT INTO Bookings VALUES ('BID0000004', '17:00', 'Normal', 06 , 'CID0000004' );
	INSERT INTO Bookings VALUES ('BID0000005', '22:00', 'VIP', 02 , 'CID0000005' );


--Payments table data--

	INSERT INTO Payments VALUES ('PID0000001', '08:00', 5000.00, '4012888888881881' , '456' , 'CID0000001' );
	INSERT INTO Payments VALUES ('PID0000002', '10:00', 4500.00, '3782822463100058' , '123' , 'CID0000002' );
	INSERT INTO Payments VALUES ('PID0000003', '13:00', 2000.00, '4222222222222000' , '789' , 'CID0000003' );        
	INSERT INTO Payments VALUES ('PID0000004', '17:00', 3000.00, '4561123647895632' , '753' , 'CID0000004' );
	INSERT INTO Payments VALUES ('PID0000005', '22:00', 4000.00, '7894456378952568' , '159' , 'CID0000005' );


--Payments_Type table data--

	INSERT INTO Payments_type VALUES ('PT000001', 'VISA', 'PID0000001');
	INSERT INTO Payments_type VALUES ('PT000002', 'Master Card', 'PID0000002');
	INSERT INTO Payments_type VALUES ('PT000003', 'VISA', 'PID0000003');
	INSERT INTO Payments_type VALUES ('PT000004', 'Credit Card', 'PID0000004');
	INSERT INTO Payments_type VALUES ('PT000005', 'Credit Card', 'PID0000005');        



--Discount table data--

	INSERT INTO Discount VALUES ('OID0000001', 500.00, 'TID0000001', 'CID0000001' );
	INSERT INTO Discount VALUES ('OID0000002', 300.00, 'TID0000002', 'CID0000002' );
	INSERT INTO Discount VALUES ('OID0000003', 0.00, 'TID0000003', 'CID0000003' );
	INSERT INTO Discount VALUES ('OID0000004', 600.00, 'TID0000004', 'CID0000004' );
	INSERT INTO Discount VALUES ('OID0000005', 400.00, 'TID0000005', 'CID0000005' );


--Feedback table data--

	INSERT INTO Feedback VALUES ('XID0000001', '2022-11-12', 'Super website for online movie tickets booking', 5 , 'CID0000001' );
	INSERT INTO Feedback VALUES ('XID0000002', '2023-03-08', 'Great discounts! ', 5 , 'CID0000002' );
	INSERT INTO Feedback VALUES ('XID0000003', '2023-04-18', 'Nice information about movies.', 4 , 'CID0000003' );
	INSERT INTO Feedback VALUES ('XID0000004', '2023-05-12', 'Superb security for payments.', 5 , 'CID0000004' );
	INSERT INTO Feedback VALUES ('XID0000005', '2023-05-20', 'Poor costumer care service', 3 , 'CID0000005' );


--Theater table data--

	INSERT INTO Theater VALUES ('HID0000001', 'Colombo', 'The Flash (2023)', 'Flix Royal' );
	INSERT INTO Theater VALUES ('HID0000002', 'Kalutara', 'Tu Jhoothi Main Makkaar (2023)', 'Flix Super' );
	INSERT INTO Theater VALUES ('HID0000003', 'Galle', 'Ksheera Sagaraya Kalabina-KSK (2023)', 'Flix Cinema' );
	INSERT INTO Theater VALUES ('HID0000004', 'Rathnapura', 'Ponniyin Selvan: Part Two (2023)', 'Flix Gold' );             
	INSERT INTO Theater VALUES ('HID0000005', 'Jaffna', 'The Little Mermaid - Disney (2023)', 'Flix Plasa' );


--Screen table data--

	INSERT INTO Screen VALUES ('YID0000001', 01, 'Royal Screen', 100, 'HID0000001' );
	INSERT INTO Screen VALUES ('YID0000002', 02, 'Super Screen', 125, 'HID0000002' );
	INSERT INTO Screen VALUES ('YID0000003', 03, 'Cinema Screen', 150, 'HID0000003' );
	INSERT INTO Screen VALUES ('YID0000004', 04, 'Diamond Screen', 175, 'HID0000004' );         
	INSERT INTO Screen VALUES ('YID0000005', 05, 'Gold Screen', 200, 'HID0000005' );


--Screen_Theater table data--

	INSERT INTO Show_Theater VALUES ('ST000001', 'SID0000001', 'HID0000001');
	INSERT INTO Show_Theater VALUES ('ST000002', 'SID0000002', 'HID0000002');
	INSERT INTO Show_Theater VALUES ('ST000003', 'SID0000003', 'HID0000003');     
	INSERT INTO Show_Theater VALUES ('ST000004', 'SID0000004', 'HID0000004');
	INSERT INTO Show_Theater VALUES ('ST000005', 'SID0000005', 'HID0000005');