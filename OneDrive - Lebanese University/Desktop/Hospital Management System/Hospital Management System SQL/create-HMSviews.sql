CREATE VIEW V_PatientOverview AS
SELECT 
    p.PATIENT_ID,
    p.FIRST_NAME,
    p.LAST_NAME,
    p.PHONE_NUMBER,
    COUNT(DISTINCT a.APPOINTMENT_ID) AS TotalAppointments,
    COUNT(DISTINCT m.RECORD_ID) AS TotalMedicalRecords,
    COALESCE(SUM(b.AMOUNT), 0) AS TotalBillingAmount
FROM 
    PATIENTS p,
    APPOINTMENTS a,
    MEDICALRECORDS m,
    BILLINGS b
WHERE 
    p.PATIENT_ID = a.PID
    AND p.PATIENT_ID = m.PID
    AND m.BID = b.BILL_ID
GROUP BY 
    p.PATIENT_ID,
    p.FIRST_NAME,
    p.LAST_NAME,
    p.PHONE_NUMBER;


CREATE VIEW V_DoctorSchedule AS
SELECT 
    d.DOCTOR_ID,
    d.FIRST_NAME,
    d.LAST_NAME,
    dep.DEPARTMENT_NAME,
    a.APPOINTMENT_ID,
    a.APPOINTMENT_DATE,
    a.STATUS,
    p.FIRST_NAME AS PatientFirstName,
    p.LAST_NAME AS PatientLastName
FROM 
    DOCTORS d,
    DEPARTMENTS dep,
    APPOINTMENTS a,
    PATIENTS p
WHERE 
    d.DEPID = dep.DEPARTMENT_ID
    AND d.DOCTOR_ID = a.DID
    AND a.PID = p.PATIENT_ID;


CREATE VIEW V_MedicalBilling AS
SELECT 
    m.RECORD_ID,
    m.RECORD_DATE,
    p.FIRST_NAME AS PatientFirstName,
    p.LAST_NAME AS PatientLastName,
    d.FIRST_NAME AS DoctorFirstName,
    d.LAST_NAME AS DoctorLastName,
    m.DIAGNOSIS,
    m.TREATMENT,
    b.BILL_ID,
    b.AMOUNT,
    b.STATUS AS BillStatus
FROM 
    MEDICALRECORDS m,
    PATIENTS p,
    DOCTORS d,
    BILLINGS b
WHERE 
    m.PID = p.PATIENT_ID
    AND m.DID = d.DOCTOR_ID
    AND m.BID = b.BILL_ID;


CREATE VIEW V_DepartmentSummary AS
SELECT 
    dep.DEPARTMENT_ID,
    dep.DEPARTMENT_NAME,
    COUNT(DISTINCT d.DOCTOR_ID) AS TotalDoctors,
    COUNT(DISTINCT a.APPOINTMENT_ID) AS TotalAppointments
FROM 
    DEPARTMENTS dep,
    DOCTORS d,
    APPOINTMENTS a
WHERE 
    dep.DEPARTMENT_ID = d.DEPID
    AND d.DOCTOR_ID = a.DID
GROUP BY 
    dep.DEPARTMENT_ID,
    dep.DEPARTMENT_NAME;

CREATE VIEW V_UpcomingAppointments AS
SELECT 
    a.APPOINTMENT_ID,
    a.APPOINTMENT_DATE,
    a.STATUS,
    p.FIRST_NAME AS PatientFirstName,
    p.LAST_NAME AS PatientLastName,
    d.FIRST_NAME AS DoctorFirstName,
    d.LAST_NAME AS DoctorLastName,
    dep.DEPARTMENT_NAME
FROM 
    APPOINTMENTS a,
    PATIENTS p,
    DOCTORS d,
    DEPARTMENTS dep
WHERE 
    a.PID = p.PATIENT_ID
    AND a.DID = d.DOCTOR_ID
    AND d.DEPID = dep.DEPARTMENT_ID
    AND a.APPOINTMENT_DATE >= CURRENT_TIMESTAMP;


CREATE VIEW V_OutstandingBills AS
SELECT 
    p.PATIENT_ID,
    p.FIRST_NAME,
    p.LAST_NAME,
    COUNT(b.BILL_ID) AS UnpaidBills,
    COALESCE(SUM(b.AMOUNT), 0) AS TotalUnpaidAmount
FROM 
    PATIENTS p,
    MEDICALRECORDS m,
    BILLINGS b
WHERE 
    p.PATIENT_ID = m.PID
    AND m.BID = b.BILL_ID
    AND b.STATUS = 'Unpaid'
GROUP BY 
    p.PATIENT_ID,
    p.FIRST_NAME,
    p.LAST_NAME;

