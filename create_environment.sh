#!/bin/bash

# Ask for the user's name
echo "Enter your name:"
read userName

# Create the main directory
mainDir="submission_reminder_$userName"
mkdir -p "$mainDir"

# Create subdirectories
mkdir -p "$mainDir/app"
mkdir -p "$mainDir/modules"
mkdir -p "$mainDir/assets"
mkdir -p "$mainDir/config"

# Create files
touch "$mainDir/app/reminder.sh"
touch "$mainDir/modules/functions.sh"
touch "$mainDir/assets/submissions.txt"
touch "$mainDir/config/config.env"
touch "$mainDir/startup.sh"

# Populate reminder.sh
cat <<EOL > "$mainDir/app/reminder.sh"
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: \$ASSIGNMENT"
echo "Days remaining to submit: \$DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions \$submissions_file
EOL

# Populate functions.sh
cat <<EOL > "$mainDir/modules/functions.sh"
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=\$1
    echo "Checking submissions in \$submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=\$(echo "\$student" | xargs)
        assignment=\$(echo "\$assignment" | xargs)
        status=\$(echo "\$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "\$assignment" == "\$ASSIGNMENT" && "\$status" == "not submitted" ]]; then
            echo "Reminder: \$student has not submitted the \$ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "\$submissions_file") # Skip the header
}
EOL

# Populate config.env
cat <<EOL > "$mainDir/config/config.env"
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOL

# Populate submissions.txt with additional students
cat <<EOL > "$mainDir/assets/submissions.txt"
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
John, Shell Navigation, not submitted
Jane, Git, submitted
Alice, Shell Basics, submitted
Bob, Shell Navigation, not submitted
Charlie, Git, submitted
Eve, Shell Basics, not submitted
Frank, Shell Navigation, submitted
Grace, Git, not submitted
Hank, Shell Basics, submitted
EOL

# Populate startup.sh
cat <<EOL > "$mainDir/startup.sh"
#!/bin/bash

# Start the reminder application
./app/reminder.sh
EOL

# Make scripts executable
chmod +x "$mainDir/app/reminder.sh"
chmod +x "$mainDir/startup.sh"

echo "Environment setup complete in $mainDir"