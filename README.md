# Hospital Management System

A web-based **Hospital Management System** built with PHP, MySQL, HTML, and CSS. The system provides an online platform for managing doctor appointments and interactions between administrators, doctors, and patients.

**MediCare** allows patients to find doctors based on their specialties, view available appointment sessions, and submit appointment requests. Doctors can manage their schedules and appointments, while administrators manage doctors, sessions, and patient information.

## 👥 User Roles

The system provides three main roles:

* **Administrator**
* **Doctor**
* **Patient**

## ✨ Features

### Administrator

* Add new doctors
* Edit doctor information
* Delete doctors
* Create and manage doctor appointment sessions
* Remove scheduled sessions
* View patient information
* View patient appointment bookings

### Doctor

* View scheduled appointments
* View appointment requests
* View scheduled sessions
* View patient information
* Edit account settings
* Delete account

### Patient

* Create an account
* Browse doctors and their specialties
* View available appointment sessions
* Book appointments online
* View previous bookings
* Edit account settings
* Delete account

## 🛠️ Technologies

* **PHP**
* **MySQL**
* **HTML5**
* **CSS3**
* **JavaScript**
* **Apache**
* **XAMPP**

## 🚀 Getting Started

### Prerequisites

Before running the project, make sure you have:

* XAMPP
* Apache
* MySQL
* PHP

### Installation

1. Clone or download the repository.

```bash
git clone YOUR_REPOSITORY_URL
```

2. Copy the project folder into your XAMPP `htdocs` directory.

```text
C:\xampp\htdocs\
```

3. Open the **XAMPP Control Panel**.

4. Start:

   * Apache
   * MySQL

5. Open phpMyAdmin:

```text
http://localhost/phpmyadmin
```

6. Create a new database named:

```text
MediCare
```

7. Import the database SQL file included in the project.

8. Open the application in your browser:

```text
http://localhost/Hospital%20Management%20System/
```

> The URL may vary depending on the name of the project folder inside `htdocs`.

## 🗂️ Main System Components

The system is organized around the following functionality:

* User authentication
* Doctor management
* Patient management
* Doctor specialties
* Appointment sessions
* Appointment booking
* Patient records
* Account management
* Administrative management

## ⚙️ Environment

The original project was developed and tested using:

| Component | Version                         |
| --------- | ------------------------------- |
| Apache    | 2.4.39                          |
| PHP       | 7.3.5                           |
| MySQL     | 5.7.26                          |
| Server    | Apache/2.4.39 (Win64) PHP/7.3.5 |

Newer versions of PHP/MySQL may require compatibility adjustments depending on the codebase.

## 📚 Project Purpose

This project demonstrates the development of a web-based appointment management system using PHP and MySQL. It provides practical experience with:

* CRUD operations
* Database management
* User authentication
* Role-based functionality
* Appointment scheduling
* Server-side PHP development
* MySQL database integration

