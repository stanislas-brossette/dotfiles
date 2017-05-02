# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
#session_root "~/home/stanislas/profiles/default-x86_64-linux-ubuntu-13.04/src/problem-generator"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "humoto"; then

  # Create a new window inline within session layout definition.
  new_window "nvim"
  run_cmd "cd \$ps/humoto"
  new_window "build-all"
  run_cmd "cd \$ps/humoto/build-all"
  new_window "root"
  run_cmd "cd \$ps/humoto"

  # Select the default active window on session creation.
  select_window 0
  run_cmd "nvim"
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
