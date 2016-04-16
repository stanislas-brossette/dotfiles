# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
#session_root "~/home/stanislas/profiles/default-x86_64-linux-ubuntu-13.04/src/problem-generator"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "Robot Features"; then

  # Create a new window inline within session layout definition.
  new_window "nvim"
  run_cmd "cd \$ps/robot-features"
  new_window "Debug"
  run_cmd "cd \$ps/robot-features/_build/_build_clang_Debug"
  new_window "Release"
  run_cmd "cd \$ps/robot-features/_build/_build_clang_Release"
  new_window "root"
  run_cmd "cd \$ps/robot-features"
  new_window "B&I"
  run_cmd "cd \$ps/build_and_install"

  # Load a defined window layout.
  #load_window "example"

  # Select the default active window on session creation.
  select_window 0

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
