rm amd64 -r
mkdir amd64
mkdir amd64/opensim_4.0-1kidzik
mkdir amd64/opensim_4.0-1kidzik/usr
mkdir amd64/opensim_4.0-1kidzik/usr/bin
cp ~/opensim_dependencies_install/simbody/libexec/simbody/simbody-visualizer amd64/opensim_4.0-1kidzik/usr/bin/
cp ~/opensim_install/lib amd64/opensim_4.0-1kidzik/usr/lib -r
cp ~/opensim_dependencies_install/BTK/lib/*/* amd64/opensim_4.0-1kidzik/usr/lib/
rm amd64/opensim_4.0-1kidzik/usr/lib/cmake -r
rm amd64/opensim_4.0-1kidzik/usr/lib/python3.5/site-packages/*.py*
rm amd64/opensim_4.0-1kidzik/usr/lib/python3.5/site-packages/opensim/__pycache__ -r
rm amd64/opensim_4.0-1kidzik/usr/lib/python3.5/site-packages/opensim/tests -r
mv amd64/opensim_4.0-1kidzik/usr/lib/python3.5/site-packages amd64/opensim_4.0-1kidzik/usr/lib/python3.5/dist-packages
mv amd64/opensim_4.0-1kidzik/usr/lib/python3.5 amd64/opensim_4.0-1kidzik/usr/lib/python3
mkdir amd64/opensim_4.0-1kidzik/DEBIAN
echo "Package: opensim
Version: 4.0-1kidzik
Section: base
Priority: optional
Architecture: amd64
Depends: freeglut3, freeglut3-dev
Maintainer: Lukasz Kidzinski <lukasz.kidzinski@stanford.edu>
Description: An UNOFFICIAL build of OpenSim 4.0. 
 This package is meant to use with the reinforcement
 learning osim-rl python environment only. For any
 other usage please refer to
 https://github.com/opensim-org/opensim-core" > amd64/opensim_4.0-1kidzik/DEBIAN/control
dpkg-deb --build amd64/opensim_4.0-1kidzik
