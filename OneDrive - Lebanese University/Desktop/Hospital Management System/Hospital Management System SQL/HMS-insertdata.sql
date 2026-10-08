INSERT INTO DEPARTMENTS (DEPARTMENT_NAME, LOCATION) VALUES
('Cardiology', 'Building A'),
('Neurology', 'Building B'),
('Radiology', 'Building C'),
('Oncology', 'Building D'),
('Pediatrics', 'Building E'),
('Orthopedics', 'Building F'),
('Dermatology', 'Building G'),
('Gastroenterology', 'Building H'),
('Urology', 'Building I'),
('ENT', 'Building J'),
('Psychiatry', 'Building K'),
('Ophthalmology', 'Building L');

INSERT INTO PATIENTS (FIRST_NAME, LAST_NAME, GENDER, DATE_OF_BIRTH, PHONE_NUMBER, ADDRESS, EMAIL) VALUES
('Charbel',' Youssef Nahra','Male','2005-08-23','1111111111','123 Main St','nahracharbel05@gmail.com'),
('Tia','Hamdan','Female','2005-09-08','2222222222','456 Elm St','tiahamdan03@gmail.com'),
('Leen','Basbous','Female','2005-05-05','3333333333','789 Oak St','leen.basbous06@gmail.com'),
('Bob','Brown','Male','1982-12-15','4444444444','321 Pine St','bob.brown@example.com'),
('Charlie','Davis','Male','1995-08-20','5555555555','654 Maple St','charlie.davis@example.com'),
('Diana','Miller','Female','1988-11-05','6666666666','987 Cedar St','diana.miller@example.com'),
('Ethan','Wilson','Male','1992-01-18','7777777777','159 Spruce St','ethan.wilson@example.com'),
('Fiona','Moore','Female','1980-09-09','8888888888','753 Birch St','fiona.moore@example.com'),
('George','Taylor','Male','1975-06-30','9999999999','852 Walnut St','george.taylor@example.com'),
('Hannah','Anderson','Female','1987-05-25','1010101010','951 Chestnut St','hannah.anderson@example.com'),
('Ian','Thomas','Male','1993-02-14','1212121212','369 Hickory St','ian.thomas@example.com'),
('Julia','Martin','Female','1986-10-30','1313131313','258 Magnolia St','julia.martin@example.com');

INSERT INTO DOCTORS (DEPID, FIRST_NAME, LAST_NAME, SPECIALIZATION, PHONE_NUMBER, EMAIL) VALUES
(1,'Dr. James','Carter','Cardiology','2111111111','james.carter@example.com'),
(2,'Dr. Laura','Hill','Neurology','2222222222','laura.hill@example.com'),
(3,'Dr. Michael','Scott','Radiology','2333333333','michael.scott@example.com'),
(4,'Dr. Emily','Adams','Oncology','2444444444','emily.adams@example.com'),
(5,'Dr. Daniel','Lewis','Pediatrics','2555555555','daniel.lewis@example.com'),
(6,'Dr. Sophia','Clark','Orthopedics','2666666666','sophia.clark@example.com'),
(7,'Dr. William','Walker','Dermatology','2777777777','william.walker@example.com'),
(8,'Dr. Olivia','Hall','Gastroenterology','2888888888','olivia.hall@example.com'),
(9,'Dr. Benjamin','Allen','Urology','2999999999','benjamin.allen@example.com'),
(10,'Dr. Grace','Young','ENT','2001010101','grace.young@example.com'),
(11,'Dr. Henry','King','Psychiatry','2010101010','henry.king@example.com'),
(12,'Dr. Emma','Wright','Ophthalmology','2020202020','emma.wright@example.com');

INSERT INTO BILLINGS (AMOUNT, BILL_DATE, STATUS) VALUES
(150.00,'2025-11-01','Unpaid'),
(200.50,'2025-11-02','Paid'),
(300.00,'2025-11-03','Unpaid'),
(450.75,'2025-11-04','Paid'),
(120.00,'2025-11-05','Unpaid'),
(500.00,'2025-11-06','Paid'),
(250.00,'2025-11-07','Unpaid'),
(175.00,'2025-11-08','Paid'),
(320.00,'2025-11-09','Unpaid'),
(400.00,'2025-11-10','Paid'),
(275.00,'2025-11-11','Unpaid'),
(350.00,'2025-11-12','Paid');

INSERT INTO MEDICALRECORDS (BID, DID, PID, DIAGNOSIS, TREATMENT, RECORD_DATE) VALUES
(1,1,1,'Flu','Rest and hydration','2025-11-01'),
(2,2,2,'Migraine','Medication and rest','2025-11-02'),
(3,3,3,'Fracture','Cast and physiotherapy','2025-11-03'),
(4,4,4,'Cancer','Chemotherapy','2025-11-04'),
(5,5,5,'Cold','Medication','2025-11-05'),
(6,6,6,'Back Pain','Physiotherapy','2025-11-06'),
(7,7,7,'Acne','Topical cream','2025-11-07'),
(8,8,8,'Stomach Pain','Medication','2025-11-08'),
(9,9,9,'Kidney Stones','Surgery','2025-11-09'),
(10,10,10,'Ear Infection','Antibiotics','2025-11-10'),
(11,11,11,'Depression','Counseling','2025-11-11'),
(12,12,12,'Eye Infection','Eye drops','2025-11-12');

INSERT INTO APPOINTMENTS (DID, PID, APPOINTMENT_DATE, STATUS) VALUES
(1,1,'2025-12-01 09:00','Scheduled'),
(2,2,'2025-12-01 10:15','Scheduled'),
(3,3,'2025-12-01 11:30','Scheduled'),
(4,4,'2025-12-02 09:00','Scheduled'),
(5,5,'2025-12-02 10:30','Scheduled'),
(6,6,'2025-12-02 11:45','Scheduled'),
(7,7,'2025-12-03 08:45','Scheduled'),
(8,8,'2025-12-03 10:15','Scheduled'),
(9,9,'2025-12-03 11:30','Scheduled'),
(10,10,'2025-12-04 09:00','Scheduled'),
(11,11,'2025-12-04 10:30','Scheduled'),
(12,12,'2025-12-04 11:45','Scheduled');
