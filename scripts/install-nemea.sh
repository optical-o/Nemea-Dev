# Compile and install NEMEA
(
 cd "/home/vagrant"
 git clone https://github.com/CESNET/Nemea.git "nemea-repo-temp" --recursive
 mv "nemea-repo-temp/"* "nemea-repo"
 rm -r "nemea-repo-temp"
 cd "nemea-repo"
 ./bootstrap.sh &&
 intercept-build ./configure --without-openssl &&
 intercept-build make -j4 &&
 sudo make install &&
 sudo ldconfig &&
 (cd nemea-framework/pytrap; python3 setup.py test; sudo python3 setup.py develop)
 (cd nemea-framework/pycommon; python3 setup.py test; sudo python3 setup.py develop)
)

