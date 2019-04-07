all:
    arm-linux-gnueabihf-gcc -Dsoc_cv_av -O2 -o helen helen.c
    arm-linux-gnueabihf-strip -s helen

clean:
    rm -rf helen
