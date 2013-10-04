# -*- mode: shell-script -*-

if `test "x$(which clang 2> /dev/null)" = x`; then
    _cmake_build_dir_has_clang=
else
    _cmake_build_dir_has_clang=:
fi

: ${CMAKE_PROFILES=Debug Release}

: ${CMAKE_PROFILE_Debug="-DCMAKE_BUILD_TYPE=Debug"}
: ${CMAKE_PROFILE_Release="-DCMAKE_BUILD_TYPE=Release"}

: ${CMAKE_BUILD_PREFIX=_build}

function makeBuildDirectory
{
    d=`pwd`
    if `test x$(find . -maxdepth 1 -name CMakeLists.txt) = x`; then
	echo "run this in your project root directory"
	return 1
    fi

    COMMON_FLAGS="-DCMAKE_INSTALL_PREFIX=$piu"

    # Create default GCC profiles.
    for p in `echo $CMAKE_PROFILES`; do
	echo "*** Creating profile $p..."
	mkdir -p "$d/$CMAKE_BUILD_PREFIX/$p"
	(cd "$d/$CMAKE_BUILD_PREFIX/$p" && \
	cmake $COMMON_FLAGS `echo $$CMAKE_PROFILE_$p` "$d")
	echo "*** ...done!"
    done

    # If clang is available, create clang profiles.
    if $_cmake_build_dir_has_clang; then
	for p in `echo $CMAKE_PROFILES`; do
	    echo "*** Creating profile $p (clang)..."
	    mkdir -p "$d/$CMAKE_BUILD_PREFIX/clang+$p"
	    (cd "$d/$CMAKE_BUILD_PREFIX/$p" && \
		CC=clang CXX=clang++ cmake \
		cmake $COMMON_FLAGS `echo $$CMAKE_PROFILE_$p` "$d")
	    echo "*** ...done!"
	done
    fi
}

alias mb=makeBuildDirectory
