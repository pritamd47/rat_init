# rat_init

Usage: 
- Clone this repository: `git clone https://github.com/pritamd47/rat_init.git`
- Clone RAT 2.0: `git clone https://github.com/pritamd47/rat_v2.git`
- Change directory to RAT 2.0: `cd rat_v2`
- Run the `init_rat.sh` script, while passing the directory of RAT 2.0 (which in this case is the current directory, `.`) with the `-d` flag: `bash ../rat_init/init_rat.sh -d .`

In one go: 
```[bash]
git clone https://github.com/pritamd47/rat_init.git
git clone https://github.com/pritamd47/rat_v2.git
cd rat_v2
bash ../rat_init/init_rat.sh -d .
```

This script installs and initializes a RAT instance -
- Creates the directories
- Installs anaconda and all the models

