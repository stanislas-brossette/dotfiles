# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
#session_root "~/home/stanislas/profiles/default-x86_64-linux-ubuntu-13.04/src/problem-generator"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "Octave"; then

  # Create a new window inline within session layout definition.
  new_window "nvim"
  run_cmd "cd octave"
  run_cmd "nvim"
  run_cmd ":vsplit"
  run_cmd ":NERDTree"
  run_cmd ":wincmd l"
  run_cmd ":wincmd l"
  run_cmd ":terminal"
  run_cmd "octave"
  run_cmd "PS1('>>')"
  # Select the default active window on session creation.

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
