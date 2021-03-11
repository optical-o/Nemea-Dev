# Compile and install NEMEA
(
 cd "/home/vagrant"
 git clone https://github.com/CESNET/Nemea.git "nemea-repo-temp" --recursive
 mv "nemea-repo-temp/"* "nemea-repo"
 rm -r "nemea-repo-temp"
 cd "nemea-repo"
 ./bootstrap.sh &&
 intercept-build ./configure --without-openssl &&
 make clean &&
 intercept-build make -j4 &&
 sudo make install &&
 sudo ldconfig &&

 sudo python3 nemea-framework/pytrap/setup.py develop
 sudo python3 nemea-framework/pycommon/setup.py develop
 #make check
)

