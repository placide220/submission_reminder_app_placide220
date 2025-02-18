#!/bin/bash

# Prompt for user's name
read -p "Enter your name: " userName

# Define main directory
main="submission_reminder_${userName}"

# Create directory structure
mkdir -p "$main/config"
mkdir -p "$main/modules"
mkdir -p "$main/app"
mkdir -p "$main/assets"

# Create necessary files
touch "$main/config/config.env"
touch "$main/assets/submissions.txt"
touch "$main/app/reminder.sh"
touch "$main/modules/functions.sh"
touch "$main/startup.sh"
touch "$main/README.md"

# Populate config.env
cat << EOF > "$main/config/config.env"
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF

# Populate submissions.txt with sample student records
cat << EOF > "$main/assets/submissions.txt"
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Gilbert, Shell Navigation, not submitted
Mucyo, Shell Navigation, not submitted
Kalisa, Shell Navigation, not submitted
Frank, Shell Navigation, not submitted
Placide, Shell Navigation, submitted
EOF

# Populate functions.sh
cat << 'EOF' > "$main/modules/functions.sh"
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}
EOF

# Populate reminder.sh
cat << 'EOF' > "$main/app/reminder.sh"
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOF

# Populate startup.sh
cat << 'EOF' > "$main/startup.sh"
#!/bin/bash

bash ./app/reminder.sh
EOF


# Make scripts executable
chmod +x "$main/modules/functions.sh"
chmod +x "$main/startup.sh"
chmod +x "$main/app/reminder.sh"

echo "Setup complete! Running the application..."
cd "$main"
./startup.sh

