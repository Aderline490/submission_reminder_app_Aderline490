## Submission Reminder App

## Description
The **Submission Reminder App** is a simple yet powerful application designed to help educators and students keep track of upcoming assignment deadlines. Built using shell scripting, this app automates the process of checking student submission statuses and sends reminders to those who have not yet submitted their assignments. It is lightweight, easy to use, and highly customizable.

### Key Features:
- **Automated Reminders**: The app checks the submission status of students and sends reminders for pending assignments.
- **Customizable Configuration**: The assignment details and deadlines can be configured in the `config.env` file.
- **Easy Setup**: The app comes with a setup script (`create_environment.sh`) that automates the creation of the required directory structure and files.
- **Scalable**: Supports multiple students and assignments, making it suitable for small to medium-sized classes.

### How It Works:
1. The app reads the assignment details (name and days remaining) from the `config.env` file.
2. It checks the `submissions.txt` file for student records and identifies those who have not submitted the assignment.
3. It prints reminders for students who have not submitted their work.

---

## Installation and Setup

### Prerequisites
- A Linux-based operating system (or a Linux environment like WSL for Windows users).
- Bash shell.
- Git (optional, for cloning the repository).

### Steps to Install and Run the App

1. **Clone the Repository**:
   Open your terminal and run the following command to clone the repository:
   ```bash
   git clone https://github.com/<yourGitHubUsername>/submission_reminder_app_<yourGitHubUsername>.git