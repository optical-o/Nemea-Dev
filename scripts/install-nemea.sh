# Compile and install NEMEA
(
 cd "/home/vagrant"
 if [ ! -d "/path/to/dir" ] 
 then
   git clone https://github.com/CESNET/Nemea.git "nemea-repo-temp" --recursive
   mv "nemea-repo-temp/"* "nemea-repo"
   mv "nemea-repo-temp/.git" "nemea-repo"
   rm -r "nemea-repo-temp"
 fi
 cd "nemea-repo"
 ./bootstrap.sh &&
 intercept-build ./configure --without-openssl &&
 intercept-build make -j4 &&
 sudo make install &&
 sudo ldconfig &&
 (cd nemea-framework/pytrap; python3 setup.py test; sudo python3 setup.py develop)
 (cd nemea-framework/pycommon; python3 setup.py test; sudo python3 setup.py develop)
)

