# Refresh everything
sudo dnf upgrade --refresh
sudo dnf upgrade

# Install new repos
sudo dnf install 'dnf-command(copr)'
sudo rpm -Uvh http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm # RPM Free Repo
sudo rpm -Uvh http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm # RPM Non-Free Repo
sudo dnf copr enable taw/joplin # Joplin repo
sudo dnf copr enable iucar/cran # CRAN repo
sudo dnf install R-CoprManager # Makes CRAN work via terminal
sudo dnf upgrade --refresh
sudo dnf upgrade

# Install from RPM
sudo dnf install -y https://dbeaver.io/files/dbeaver-ce-latest-stable.x86_64.rpm # DBeaver
sudo dnf install -y https://zoom.us/client/5.17.5.2543/zoom_x86_64.rpm # Zoom - TODO: update this URL

# Install languages
sudo dnf install -y git R ruby ruby-devel julia mysql-devel mysql-server

# Install R packages
sudo dnf install -y R-CRAN-tidyverse R-CRAN-SHELF R-CRAN-brms R-CRAN-zoo R-CRAN-parallely R-CRAN-readbulk R-CRAN-data.table R-CRAN-DATAstudio R-CRAN-FakeR R-CRAN-BACCO R-CRAN-bayesplot R-CRAN-calibrator R-CRAN-caret R-CRAN-cricketdata R-CRAN-cricketr R-CRAN-MySQL R-CRAN-elo R-CRAN-lubridate R-CRAN loo R-CRAN-lme4 R-CRAN-parallel R-CRAN-readr R-CRAN-readxl R-CRAN-extraDistr R-CRAN-rbayesianoptimization R-CRAN-xgboost R-CRAN-tidybayes R-CRAN-forecast R-CRAN-reticulate R-CRAN-leaflet

# Install python packages - note that Discord.py is installed before py-cord 
pip install --upgrade pip
pip install wheel Discord.py py-cord pandas gensim spacy nltk requests asyncio python-dotenv importlib_resources pymysql pillow==9.0.1 tabulate sqlalchemy bertopic pandas numpy boto3 scikit-learn xgboost

# Install ruby gems
gem install nokogiri discordrb csv daru gnuplotrb distribution sciruby cmdstan rumale json tzinfo rubyzip parallel jekyll mysql2 rubocop

# Install packages from repo
sudo dnf install -y vlc thunderbird neofetch putty joplin gparted libreoffice libreoffice-langpack-de clementine Discord steam

# Install codecs
sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf install lame\* --exclude=lame-devel
sudo dnf group upgrade --with-optional Multimedia

# Install Sublime Text
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
sudo dnf install -y sublime-text

# Remove software
sudo dnf remove -y kmail # Replace with Thunderbird
sudo dnf remove -y dragonplayer # Replace with VLC
sudo dnf remove -y kwrite # Replace with Sublime
sudo dnf remove -y kmines # No games
sudo dnf remove -y kmahjongg #' No games
sudo dnf remove -y kpat # No games 
sudo dnf remove -y akonadi-import-wizard # This imports data into KMail etc, but I don't use it
sudo dnf remove -y kmag # Screen magnifier
sudo dnf remove -y kaddressbook # I don't use an address book
sudo dnf remove -y kcalc # No need for a calculator
sudo dnf remove -y kmouth # Text to speech
sudo dnf remove -y korganizer # Don't use an organisation program
sudo dnf remove -y konversation # Don't use IRC
sudo dnf remove -y kmousetool # Auto clicker
sudo dnf remove -y krdc # Remote desktop client
sudo dnf remove -y kwalletmanager5 # Don't use a wallet manager


echo "All done"

