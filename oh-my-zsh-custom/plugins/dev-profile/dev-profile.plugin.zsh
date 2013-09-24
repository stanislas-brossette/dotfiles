# -*- shell-script -*-

# Development profile management
################################
#
# When developping, it is common to keep one (or several) installation
# prefix in one's HOME directory.
#
# However, updating and maintaining environment variables so that this
# custom installation prefix is detected and user properly by various
# tools (pkg-config, CMake, man, etc.) is cumbersome.
#
# This plug-in will handle that for you.

# Default value for the profile directory.
: ${PROFILES_DIR:="$HOME/profiles"}

# create_profile(name)
# ------------------
#
# Create a new profile with a specific name.
function create_profile()
{
    if test x"$1" = x; then
	echo "create_profile needs a profile name"
	echo "To create a profile which match your computer architecture,"
	echo "use create_profile_native"
	return 1
    fi
    
    if test -d "$PROFILES_DIR/$1"; then
	echo "profile already exists"
	return 1
    fi

    mkdir -p "$PROFILES_DIR"
    mkdir -p "$PROFILES_DIR/$1"
    mkdir -p "$PROFILES_DIR/$1/src"
    mkdir -p "$PROFILES_DIR/$1/install"
    mkdir -p "$PROFILES_DIR/$1/build"
    

    # Determine environment variables value.
    PYTHON_SITE_PACKAGES=
    PYTHON_DIST_PACKAGES=
    if ! test x`which python` = x; then
	PYTHON_SITE_PACKAGES="export PYTHON_SITE_PACKAGES=\$pi/"\
`python -c \
"import sys, os; print os.sep.join(['lib', 'python' + sys.version[:3], 'site-packages'])"`
	PYTHON_DIST_PACKAGES="export PYTHON_DIST_PACKAGES=\$pi/"\
`python -c \
"import sys, os; print os.sep.join(['lib', 'python' + sys.version[:3], 'dist-packages'])"`
    fi

# Fill directories.
    cp "$ZSH/plugins/dev-profile/config.sh.in" "$PROFILES_DIR/$1/config.sh"
    sed -i \
	-e "s|@PROFILE_DIR@|$PROFILES_DIR/$1|g" \
	-e "s|@PYTHON_SITE_PACKAGES@|$PYTHON_SITE_PACKAGES|g" \
	-e "s|@PYTHON_DIST_PACKAGES@|$PYTHON_DIST_PACKAGES|g" \
	"$PROFILES_DIR/$1/config.sh"
    
    echo "Profile $1 created!"
    echo ""
    echo "Please add PROFILE='$1'"
    echo "to your ~/.zshenv file to enable this profile."
}

# create_profile_native(prefix='default')
# ---------------------------------------
#
# Generate a profile and determine its name automatically.
# The name is prefixed by the "default" string.
# This string can overriden by passing a parameter to this function.
#
# This is, for instance, useful when you share your HOME directory
# between several machines to ensure you wil not mix incompatible
# binaries/libraries together.
function create_profile_native()
{
    PREFIX='default'
    ARCH=`uname -a | sed 's|.* \(.*\) GNU/Linux$|\1|'`
    KERNEL=`uname -s | tr '[:upper:]' '[:lower:]'`
    DIST='unknown'
    if ! test x"$1" = x; then
	PREFIX=$1
    fi
    if test -f /etc/issue; then
	DIST=`cat /etc/issue | sed 's|\([^ ]*\) \([0-9.]*\) .*|\1-\2|' | tr '[:upper:]' '[:lower:]'`
    fi
    create_profile "$PREFIX-$ARCH-$KERNEL-$DIST"
}


# Load the profile if the PROFILE variable is set.
if `test x$PROFILE = x`; then
    echo "no profile is set"
else
    CONFIG_SH="$HOME/profiles/$PROFILE/config.sh"
    test -f "$CONFIG_SH" && source "$CONFIG_SH" \
	|| echo "failed to load profile $PROFILE" \
	&& echo "$PROFILE profile loaded"
fi
