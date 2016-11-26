# Settings
PKGNAME=python3-opensim
PKGVER=4.0-1kidzik
PKGARCH=amd64

# Prepare path
PREFIX=$PKGARCH/$PKGNAME-$PKGVER

# Prepare the directories
rm $PKGARCH -r
mkdir $PREFIX -p
mkdir $PREFIX/usr/bin -p

# Copy the build
cp ~/opensim_dependencies_install/simbody/libexec/simbody/simbody-visualizer $PREFIX/usr/bin/
cp ~/opensim_install/lib $PREFIX/usr/lib -r
cp ~/opensim_dependencies_install/BTK/lib/*/* $PREFIX/usr/lib/

# Remove not used files
rm $PREFIX/usr/lib/cmake -r
rm $PREFIX/usr/lib/python3.5/site-packages/*.py*
rm $PREFIX/usr/lib/python3.5/site-packages/opensim/__pycache__ -r
rm $PREFIX/usr/lib/python3.5/site-packages/opensim/tests -r

# Make it python3 compatible
mv $PREFIX/usr/lib/python3.5/site-packages $PREFIX/usr/lib/python3.5/dist-packages
mv $PREFIX/usr/lib/python3.5 $PREFIX/usr/lib/python3

# Debian description
mkdir $PREFIX/DEBIAN
echo "Package: python3-opensim
Version: 4.0-1kidzik
Section: base
Priority: optional
Architecture: amd64
Depends: freeglut3, freeglut3-dev, liblapack-dev
Maintainer: Lukasz Kidzinski <lukasz.kidzinski@stanford.edu>
Description: An UNOFFICIAL build of OpenSim 4.0. 
 This package is meant to use with the reinforcement
 learning osim-rl python environment only. For any
 other usage please refer to
 https://github.com/opensim-org/opensim-core" > $PREFIX/DEBIAN/control

# Create the package
dpkg-deb --build $PREFIX
