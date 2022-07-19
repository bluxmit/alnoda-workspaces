#!/bin/bash

# Batch creation of user accounts in RStudio server. The script reads a list
# of username and password pairs from the `BATCH_USER_CREATION` enviroment
# variable and uses this information to update a group of existing users when
# the container starts. Each pair is of the format: username:password and is
# separated from the next by a semicolon, with no intervening whitespace.
# Usernames may only be up to 32 characters long (required by `useradd`) and
# by default the supplied passwords must be in clear-text (later encrypted by
# `chpasswd`). If an username already exists, the script will deny that
# particular account creation request; if not, the user account will be
# created, the login shell set to Bash and the user's home directory created,
# if it does not exist. By default, a group will be created for each new user
# with the same name as her username. If the groupname already exists, the
# script will deny the group creation request. If the password is not
# specified, it will be assumed that it is equals to the username. All users
# will also be added to the `staff` group (same as rstudio user). A directory
# called .rstudio/monitored/user-settings/user-settings is created in that
# users home directory to store RStudio initial preferences. Users are not
# allowed to read other users' home directory.

set -e

# Remove spaces
remove_spaces() {
    local var="$*"
    # Remove all spaces
    var=${var//$' '/''}
    echo -e "$var"
    return 0
}

function create_user() {
    local username=$1
    local password=$2

    echo "Processing user '${username}'."

    if id -u "$username" >/dev/null 2>&1; then
        echo "${username} user already exists. Nothing else to do."
    else
        useradd -s /bin/bash -m "$username"
        # invalid user name
        if [ "$?" == 3 ]; then
            echo "Failed to create user '${username}'."
            return
        fi

        if [ -z "$password" ]; then
            echo "Password not provided. Setting it equals to username."
            password=${username}
        fi
        echo "${username}:${password}" | chpasswd

        addgroup "${username}" staff

        mkdir -p "/home/${username}/.rstudio/monitored/user-settings"
        printf "alwaysSaveHistory='0' \
        \nloadRData='0' \
        \nsaveAction='0'" \
            >"/home/${username}/.rstudio/monitored/user-settings/user-settings"

        chown -R "${username}:${username}" "/home/${username}"
        # Prevent other users, but the owner, from accessing a home directory
        chmod 0700 "/home/${username}"
    fi

    # If shiny server installed, make the user part of the shiny group
    if [ -x "$(command -v shiny-server)" ]; then
        adduser "${username}" shiny
    fi

    echo "Done with user ${username}."
}

if [ -n "$BATCH_USER_CREATION" ]; then
    echo "Requested creation of multiple user accounts in batch mode."

    BATCH_USER_CREATION=$(remove_spaces "$BATCH_USER_CREATION")

    for user in $(echo "$BATCH_USER_CREATION" | tr ';' ' '); do
        IFS=: read -r username password <<<"${user}"

        if [ -z "$username" ]; then
            echo "Failed to create user: username undefined"
            continue
        else
            create_user "$username" "$password" || true
        fi
    done
    echo "Finished creation of multiple user accounts in batch mode."
fi
