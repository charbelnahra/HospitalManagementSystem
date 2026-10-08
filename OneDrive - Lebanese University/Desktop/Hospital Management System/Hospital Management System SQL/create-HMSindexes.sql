USE HospitalManagementSystem
go

create nonclustered index Appointment_Patient_FK on APPOINTMENTS (PID ASC)
go


create nonclustered index Appointment_Doctor_FK on APPOINTMENTS (DID ASC)
go


create nonclustered index Doctor_Department_FK on DOCTORS (DEPID ASC)
go


create nonclustered index MedicalRecords_Bill_FK on MEDICALRECORDS (BID ASC)
go


create nonclustered index MedicalRecords_Patient_FK on MEDICALRECORDS (PID ASC)
go

create nonclustered index MedicalRecords_Doctor_FK on MEDICALRECORDS (DID ASC)
go

create index Appointment_Date on APPOINTMENTS (appointment_date)
go

create index Doctor_Name on Doctors (last_name ASC)
go

create index Bill_Status on BILLINGS (status)
go

create index MedicalRecord_date on MEDICALRECORDS (record_date)
go

create index Patient_Name on PATIENTS (last_name ASC)
go
