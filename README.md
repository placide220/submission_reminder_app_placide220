# 📌 Submission Reminder App

A **shell-based reminder application** designed to help students track and complete their assignments on time. This app automatically **checks submission records** and sends reminders to students who have not submitted their work.

## 📢 Features

✅ **Automated Submission Tracking** – Reads a file and checks who hasn’t submitted their assignments.  
✅ **Custom Reminders** – Displays reminders for students who need to submit assignments.  
✅ **Easy Setup** – A simple script sets up the environment in seconds.  
✅ **Configurable Settings** – Adjust settings like assignment name and due date in the configuration file.  

---

## 🛠️ Installation & Setup

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/yourgithubusername/submission_reminder_app.git
cd submission_reminder_app
```

### 2️⃣ Run the Setup Script
Execute the script to create the necessary directory structure and files:
```bash
chmod +x create_environment.sh
./create_environment.sh
```
- The script will prompt you to enter your name.
- It will generate a folder named `submission_reminder_{yourName}` with all required files.

### 3️⃣ Run the Reminder App
After setup is complete, navigate to the new directory and start the app:
```bash
cd submission_reminder_{yourName}
./startup.sh
```

---

## 🎯 How It Works

1. **Creates the Environment**  
   The script generates a structured directory and required files:
   ```
   submission_reminder_{yourName}/
   ├── config/
   │   ├── config.env
   ├── assets/
   │   ├── submissions.txt
   ├── modules/
   │   ├── functions.sh
   ├── app/
   │   ├── reminder.sh
   ├── startup.sh
   ├── README.md
   ```

2. **Reads Submission Data**  
   The `submissions.txt` file contains a list of students and their submission status.

3. **Checks for Pending Assignments**  
   The app compares student records against the assignment requirements and generates reminders.

4. **Displays Reminders**  
   The script outputs a list of students who have not submitted their assignments.

---

## ⚙️ Configuration

Modify the `config.env` file to customize settings:

```bash
# Config File (config.env)
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
```

- **ASSIGNMENT**: The name of the assignment being tracked.  
- **DAYS_REMAINING**: Number of days left before the deadline.  

---

## 🔹 Example Output

When you run `./startup.sh`, the script will display:

```
Assignment: Shell Navigation
Days remaining to submit: 2 days
--------------------------------------------
Reminder: Chinemerem has not submitted the Shell Navigation assignment!
Reminder: Gilbert has not submitted the Shell Navigation assignment!
Reminder: Mucyo has not submitted the Shell Navigation assignment!
Reminder: Kalisa has not submitted the Shell Navigation assignment!
Reminder: Frank has not submitted the Shell Navigation assignment!
Reminder: Placide has not submitted the Shell Navigation assignment!
Reminder application executed successfully!

---

