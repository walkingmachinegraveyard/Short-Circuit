#!/bin/sh -x

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

cd "/home/wm/Short-Circuit/src/joystick_drivers/wiimote"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
/usr/bin/env \
    PYTHONPATH="/home/wm/Short-Circuit/install/lib/python2.7/dist-packages:/home/wm/Short-Circuit/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/wm/Short-Circuit/build" \
    "/usr/bin/python" \
    "/home/wm/Short-Circuit/src/joystick_drivers/wiimote/setup.py" \
    build --build-base "/home/wm/Short-Circuit/build/joystick_drivers/wiimote" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/wm/Short-Circuit/install" --install-scripts="/home/wm/Short-Circuit/install/bin"
