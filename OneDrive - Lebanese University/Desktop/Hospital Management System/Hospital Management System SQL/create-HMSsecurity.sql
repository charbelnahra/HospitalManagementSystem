CREATE LOGIN doctor_login WITH PASSWORD='doc.1';
CREATE LOGIN nurse_login WITH PASSWORD='nurse.1';
CREATE LOGIN receptionist_login WITH PASSWORD='receptionist.1';
CREATE LOGIN billing_login WITH PASSWORD='billing.1';
CREATE LOGIN admin_login WITH PASSWORD='admin.1';

USE HospitalManagementSystem;

CREATE USER doctor_user FOR LOGIN doctor_login;
CREATE USER nurse_user FOR LOGIN nurse_login;
CREATE USER receptionist_user FOR LOGIN receptionist_login;
CREATE USER billing_user FOR LOGIN billing_login;
CREATE USER admin_user FOR LOGIN admin_login;

CREATE ROLE doctor;
CREATE ROLE nurse;
CREATE ROLE receptionist;
CREATE ROLE billing;
CREATE ROLE admin;

GRANT SELECT,INSERT,UPDATE ON Patient TO doctor;
GRANT SELECT,INSERT,UPDATE ON MedicalRecords TO doctor;

GRANT SELECT ON Patient TO nurse;
GRANT SELECT ON Appointment TO nurse;

GRANT SELECT,INSERT,UPDATE ON Appointments TO receptionist;
GRANT SELECT,INSERT ON Patient TO receptionist;

GRANT SELECT,INSERT,UPDATE ON Billing TO billing;

GRANT ALL PRIVILEGES TO admin;

ALTER ROLE doctor ADD MEMBER doctor_user;
ALTER ROLE nurse ADD MEMBER nurse_user;
ALTER ROLE receptionist ADD MEMBER receptionist_user;
ALTER ROLE billing ADD MEMBER billing_user;
ALTER ROLE admin ADD MEMBER admin_user;

DENY DELETE ON Patient TO doctor;
DENY SELECT,UPDATE,INSERT ON Billing TO nurse;
DENY INSERT,UPDATE ON Appointments TO billing;





