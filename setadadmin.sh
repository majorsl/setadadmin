#!/bin/sh
# version 1.0
# This will take a group name and check if a user is a member of it against Active
# Directory. If the user is a member, perform an action. In this case, make them a
# local administrator on their macOS machine.

# Set group name to check against.
groupname="faculty"

if [ "`/usr/bin/dsmemberutil checkmembership -U $@ -G $groupname`" == "user is a member of the group" ]; then
/usr/bin/dscl . merge /Groups/admin GroupMembership $@
fi
